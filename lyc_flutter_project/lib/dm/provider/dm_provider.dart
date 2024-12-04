import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/dm/model/chat_model.dart';
import 'package:lyc_flutter_project/dm/repository/chat_repository.dart';

class DMProvider extends ChangeNotifier {
  final ChatRepositoryProvider repositoryProvider;

  DMProvider({
    required this.repositoryProvider,
  });

  bool _isLoading = false;

  get isLoading => _isLoading;

  List<ChatModel> _chatList = [];

  get chatList => _chatList;

  bool _hasMore = true;

  Future<void> getChatList({
    bool refresh = false,
    int pageNum = 0,
    int pageSize = 10,
  }) async {
    if (_isLoading || (!refresh && !_hasMore)) return;

    if (!refresh && _chatList.isNotEmpty) {
      pageNum = _chatList.length;
    }

    try {
      _isLoading = true;
      final resp = await repositoryProvider.repository.getChatList(
        pageNum: pageNum,
        pageSize: pageSize,
      );
      final list = resp.result.chats;
      _chatList = refresh
          ? [...list]
          : [
              ..._chatList,
              ...list,
            ];
      _hasMore = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
