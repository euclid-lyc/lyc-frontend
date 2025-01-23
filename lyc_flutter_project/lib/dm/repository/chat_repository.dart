import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/dm/model/chat_model.dart';
import 'package:lyc_flutter_project/dm/model/chat_room_model.dart';
import 'package:lyc_flutter_project/dm/model/make_schedule_model.dart';
import 'package:lyc_flutter_project/dm/model/schedule_model_response.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_repository.g.dart';

class ChatRepositoryProvider extends ChangeNotifier {
  final Dio dio;
  late ChatRepository repository;

  ChatRepositoryProvider({required this.dio}) {
    repository = ChatRepository(
      dio,
      baseUrl: "http://$ip/lyc/chats",
    );
  }
}

@RestApi()
abstract class ChatRepository {
  factory ChatRepository(Dio dio, {String baseUrl}) = _ChatRepository;

  @GET("")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<ChatListModel>> getChatList({
    @Query("pageNum") required int pageNum,
    @Query("pageSize") required int pageSize,
  });

  @PATCH("/{chatId}")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<ChatRoomModel>> getChatMessages({
    @Path("chatId") required int chatId,
    @Query("pageSize") required int pageSize,
    @Query("cursorDateTime") required String cursorDateTime,
  });

  @POST("/{chatId}/schedules")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<MakeScheduleModel>> makeSchedule({
    @Path("chatId") required int chatId,
    @Body() required MakeScheduleModel model,
  });

  @GET("/{chatId}/schedules")
  @Headers({"accessToken": "true"})
  Future<ApiResponse<ScheduleModelListResponse>> getSchedules({
    @Path("chatId") required int chatId,
    @Query("year") required int year,
    @Query("month") required int month,
    @Query("day") int? day,
  });
}
