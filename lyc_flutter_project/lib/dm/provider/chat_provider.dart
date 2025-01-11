import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/dm/model/chat_message_model.dart';
import 'package:lyc_flutter_project/dm/model/make_schedule_model.dart';
import 'package:lyc_flutter_project/dm/model/message_model.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model_response.dart';
import 'package:lyc_flutter_project/dm/repository/chat_repository.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepository repository;
  final int chatId;
  final String? profileImage;
  final String nickname;
  final String createdAt;

  ChatProvider({
    required this.repository,
    required this.chatId,
    required this.nickname,
    required this.createdAt,
    this.profileImage,
  }) {
    scrollController = ScrollController()..addListener(paginateMessages);
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    now = DateTime.now();
    initChat();
    initCalendar();
  }

  bool _disposed = false;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  // ----------------- 채팅 ---------------------------------------
  late final ScrollController scrollController;
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  late final DateTime now;

  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;

  String? _accessToken;
  List<MessageModel> _messageList = [];
  bool hasMore = true;
  bool loadingMessages = false;
  StompClient? _client;

  String initialCursor = '';
  bool loading = false;

  List<MessageModel> get messageList => _messageList;

  Future<void> initChat() async {
    loading = true;
    initialCursor = createdAt;
    await getToken();
    getClient();
    getPreviousMessages();
    loading = false;
    notifyListeners();
  }

  void paginateMessages() {
    const threshold = 100.0;
    if (scrollController.position.pixels <= threshold) {
      if (_messageList.isNotEmpty) {
        final oldestMessage = _messageList.first;
        final oldestTimestamp = DateTime.parse(oldestMessage.createdAt);
        final initialTime = DateTime.parse(initialCursor);

        if (oldestTimestamp.isAfter(initialTime)) {
          getPreviousMessages();
        }
      }
    }
  }

  Future<void> getPreviousMessages({
    int pageSize = 15,
    String cursorDateTime = '2099-11-20T00:58:45.541933',
  }) async {
    if (loadingMessages || !hasMore) return;
    if (messageList.isNotEmpty) {
      cursorDateTime = messageList.first.createdAt;
    }
    try {
      loadingMessages = true;
      final ApiResponse<ChatMessageListModel> result = await repository.getChatMessages(
        chatId: chatId,
        pageSize: pageSize,
        cursorDateTime: cursorDateTime,
      );
      final messages = result.result.messages
          .map(
            (e) => MessageModel(
              content: e.content,
              type: e.sender == nickname ? BubbleType.receiverBubble : BubbleType.sendBubble,
              image: e.profileImage,
              createdAt: e.createdAt,
            ),
          )
          .toList();
      _messageList = [...messages, ..._messageList];
    } on DioException {
      debugPrint("[에러] [메시지 목록 불러오기]");
    } finally {
      loadingMessages = false;
    }
  }

  Future<void> getToken() async {
    final accessToken = await DioProvider().storage.read(key: accessTokenKey);
    _accessToken = accessToken!;
  }

  void onConnect(StompFrame frame) {
    debugPrint("클라이언트 연결 성공");
    subscribeMessage();
    notifyListeners();
  }

  Future<void> getClient() async {
    final client = StompClient(
      config: StompConfig(
        url: "ws://$ip/ws/lyc",
        onConnect: onConnect,
        beforeConnect: () async {
          debugPrint("연결 대기 상태");
          await Future.delayed(const Duration(milliseconds: 200));
          debugPrint('연결 시도 상태...');
        },
        onWebSocketError: (dynamic error) {
          debugPrint('웹소켓 에러: ${error.toString()}');
        },
        onStompError: (frame) {
          debugPrint('STOMP 에러: ${frame.body}');
        },
        onDisconnect: (frame) {
          debugPrint('연결 끊김');
        },
      ),
    );
    _client = client;

    client.activate();
    debugPrint("클라이언트 활성화 완료");
  }

  void sendMessage({
    required String content,
    bool isText = true,
  }) {
    if (_disposed || _accessToken == null || _client == null) return;
    final msg = MessageRequest(
      content: content,
      isText: isText,
      token: _accessToken!,
    );
    // debugPrint("채팅 메시지 전송 시도");
    _client?.send(
      destination: "/pub/chats/$chatId",
      body: jsonEncode(msg.toJson()),
    );
    // debugPrint("채팅 메시지 전송 완료");
    _messageList = [
      MessageModel(
        content: content,
        type: BubbleType.sendBubble,
        createdAt: now.toString(),
      ),
      ..._messageList,
    ];
    notifyListeners();
    // debugPrint("채팅 메시지 목록에 추가");
    // debugPrint("send: ${_messageList.map((e) => e.content).toList().toString()}");
  }

  void subscribeMessage() {
    if (_disposed || _accessToken == null || _client == null) return;
    _client?.subscribe(
      destination: "/sub/chats/$chatId",
      callback: (p0) {
        debugPrint("수신 콜백 함수 실행");

        debugPrint("수신 FRAME: ${p0.body}");
        if (p0.body == null) return;
        final resp = jsonDecode(p0.body!);
        if (resp["isSuccess"]) {
          final msg = MessageResponse.fromJson(resp["result"]);
          if (msg.sender == nickname) {
            _messageList = [
              MessageModel(
                content: msg.content,
                type: BubbleType.receiverBubble,
                image: profileImage,
                createdAt: now.toString(),
              ),
              ..._messageList,
            ];
          }
          notifyListeners();
          // debugPrint("receive: ${_messageList.map((e) => e.content).toList().toString()}");
        }
      },
    );
  }

  void onFieldSubmitted() {
    if (_disposed || !isTextFieldEnable) return;
    try {
      final content = textEditingController.text;

      debugPrint("전송 버튼 확인, 전송 시도");
      sendMessage(content: content);
      debugPrint("전송 완료");

      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      textEditingController.text = "";
      notifyListeners();
    } catch (e) {
      Exception(e);
    }
  }

  // ----------------- 채팅 ---------------------------------------

  // ----------------- 일정 추가 ---------------------------------------

  DateTime queryDateTime = DateTime.now();
  String memo = '';
  bool allDay = false;

  void yearSelected(int number) {
    queryDateTime = queryDateTime.copyWith(year: number);
    notifyListeners();
  }

  void monthSelected(int number) {
    queryDateTime = queryDateTime.copyWith(month: number);
    notifyListeners();
  }

  void daySelected(int number) {
    queryDateTime = queryDateTime.copyWith(day: number);
    notifyListeners();
  }

  void hourSelected(int number) {
    queryDateTime = queryDateTime.copyWith(hour: number);
    notifyListeners();
  }

  void minuteSelected(int number) {
    queryDateTime = queryDateTime.copyWith(minute: number);
    notifyListeners();
  }

  void toggleAllDay(p0) {
    allDay = p0;
    notifyListeners();
  }

  void memoChanged(String text) {
    memo = text;
  }

  Future<void> makeSchedule() async {
    late final String date;
    if (allDay) {
      date = "${queryDateTime.year}-${queryDateTime.month.toString().padLeft(2, '0')}-${queryDateTime.day.toString().padLeft(2, '0')}";
    } else {
      date = queryDateTime.toIso8601String();
    }
    try {
      final result = await repository.makeSchedule(
        chatId: chatId,
        model: MakeScheduleModel(
          date: date,
          memo: memo,
        ),
      );
      scheduleList.clear();
      currentMonthSchedules.clear();
      initCalendar();
      debugPrint(result.message);
    } on DioException {
      debugPrint("makeSchedule 실패");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  DateTime? selectedDate;

  // DraggableScrollableSheet의 컨트롤러
  ScrollController? draggableScrollController;

  // 리스트 스크롤 컨트롤러
  final ScrollController listScrollController = ScrollController();

  double _draggablePosition = 0.4;

  double get draggablePosition => _draggablePosition;

  void setDraggableScrollController(ScrollController controller) {
    draggableScrollController = controller;
  }

  void updateDraggablePosition(double newPosition) {
    _draggablePosition = newPosition.clamp(0.3, 1.0);
    notifyListeners();
  }

  void handleDraggableDrag(double delta) {
    if (draggableScrollController == null) return;

    double newPosition = _draggablePosition - delta / 600;
    updateDraggablePosition(newPosition);
  }

  void scrollToSchedule(DateTime date) {
    if (!listScrollController.hasClients) {
      return;
    }

    final selectedScheduleIndex = schedules.indexWhere((schedule) =>
    schedule.date.year == date.year &&
        schedule.date.month == date.month &&
        schedule.date.day == date.day);

    if (selectedScheduleIndex != -1) {
      const itemHeight = (12.0 * 2) + 40.0 + 1.0 + 16.0;

      listScrollController.animateTo(
        selectedScheduleIndex * itemHeight,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // ----------------- 일정 추가 ---------------------------------------

  // ----------------- 일정 화면 ---------------------------------------

  DateTime calendarDate = DateTime.now();

  // 달 별 일정들을 리스트로 저장
  List<List<ScheduleModel>> scheduleList = [];

  // 미니 달력에서 보여주기 위해 이번 달 일정 따로 저장
  List<ScheduleModel> currentMonthSchedules = [];

  // 인덱스로 월별 일정을 꺼내 보여줌
  int calendarIndex = 0;

  bool loadingCalendar = false;

  List<ScheduleModel> get schedules => scheduleList.isEmpty ? [] : scheduleList[calendarIndex];

  void showPrevMonth() {
    calendarDate = calendarDate.copyWith(month: calendarDate.month - 1);
    if (calendarIndex > 0) {
      calendarIndex--;
    } else {
      getSchedules(date: calendarDate, prev: true);
    }
    notifyListeners();
  }

  Future<void> showNextMonth() async {
    calendarDate = calendarDate.copyWith(month: calendarDate.month + 1);
    if (calendarIndex < scheduleList.length - 1) {
      calendarIndex++;
    } else {
      await getSchedules(date: calendarDate);
      calendarIndex++;
    }
    notifyListeners();
  }

  void initCalendar() {
    getSchedules(date: calendarDate);
  }

  Future<void> getSchedules({
    required DateTime date,
    bool prev = false,
  }) async {
    if (loadingCalendar) return;

    loadingCalendar = true;
    final ApiResponse<ScheduleModelListResponse> result = await repository.getSchedules(
      chatId: chatId,
      year: date.year,
      month: date.month,
    );
    if (currentMonthSchedules.isEmpty) {
      currentMonthSchedules = result.result.schedules
          .map(
            (e) => ScheduleModel(
              date: DateTime.parse(e.date),
              memo: e.memo,
            ),
          )
          .toList();
    }
    // prev면 리스트 앞에 넣기
    if (prev) {
      scheduleList = [
        result.result.schedules
            .map(
              (e) => ScheduleModel(
                date: DateTime.parse(e.date),
                memo: e.memo,
              ),
            )
            .toList(),
        ...scheduleList,
      ];
    } else {
      scheduleList = [
        ...scheduleList,
        result.result.schedules
            .map(
              (e) => ScheduleModel(
                date: DateTime.parse(e.date),
                memo: e.memo,
              ),
            )
            .toList(),
      ];
    }
    debugPrint('${date.year}년 ${date.month}월 일정 가져오기 성공');
    notifyListeners();
    loadingCalendar = false;
  }

  // ----------------- 일정 화면 ---------------------------------------

  @override
  void dispose() {
    _disposed = true;
    _client?.deactivate();
    _client = null;
    _messageList.clear();
    scrollController.removeListener(paginateMessages);
    scrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
