import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:lyc_flutter_project/common/dio/dio.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/dm/model/message_model.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

class ChatProvider extends ChangeNotifier {
  final int chatId;
  final String? profileImage;
  final String nickname;

  ChatProvider({
    required this.chatId,
    required this.nickname,
    this.profileImage,
  }) {
    initChat();
  }

  bool _disposed = false;

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  late final ScrollController scrollController = ScrollController();
  late final TextEditingController textEditingController =
      TextEditingController();
  late final FocusNode focusNode = FocusNode();

  bool get isTextFieldEnable => textEditingController.text.isNotEmpty;

  String? _accessToken;
  List<MessageModel> _messageList = [];
  StompClient? _client;

  bool loading = false;

  List<MessageModel> get messageList => _messageList;

  Future<void> initChat() async {
    loading = true;
    await getToken();
    getClient();
    loading = false;
    notifyListeners();
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
    debugPrint("채팅 메시지 전송 시도");
    _client?.send(
      destination: "/pub/chats/$chatId",
      body: jsonEncode(msg.toJson()),
    );
    debugPrint("채팅 메시지 전송 완료");
    _messageList = [
      MessageModel(
        content: content,
        type: BubbleType.sendBubble,
      ),
      ..._messageList,
    ];
    notifyListeners();
    debugPrint("채팅 메시지 목록에 추가");
    debugPrint("send: ${_messageList.map((e) => e.content).toList().toString()}");
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
              ),
              ..._messageList,
            ];
          }
          notifyListeners();
          debugPrint("receive: ${_messageList.map((e) => e.content).toList().toString()}");
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

  @override
  void dispose() {
    _disposed = true;
    _client?.deactivate();
    _client = null;
    _messageList.clear();
    scrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
