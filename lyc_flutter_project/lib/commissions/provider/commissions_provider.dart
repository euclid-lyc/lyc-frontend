import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/commissions/model/commission_model.dart';
import 'package:lyc_flutter_project/commissions/model/commission_request.dart';
import '../repository/commissions_repository.dart';
import 'package:intl/intl.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepositoryProvider repositoryProvider;

  CommissionsProvider({required this.repositoryProvider});

  bool _isLoading = false;

  List<CommissionModel> _commissionList = [];

  bool get isLoading => _isLoading;

  get commissionList => _commissionList;

  CommissionRequest request = CommissionRequest.defaultValue();

  Future<void> createCommission() async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .createCommission(commissionRequest: request);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getCommissionList({
    bool refresh = false,
    int pageSize = 10,
  }) async {
    if (_isLoading) return;

    _isLoading = true;

    notifyListeners();

    try {
      // _commissionList가 비어 있지 않으면 마지막 항목의 createdAt을 사용
      final lastCreatedAt = _commissionList.isNotEmpty
          ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(
              _commissionList[_commissionList.length - 1].createdAt as DateTime,
            )
          : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(DateTime.now());

      final resp = await repositoryProvider.commissionsRepository
          .getCommissionList(pageSize: pageSize, dateTime: lastCreatedAt);
      debugPrint(resp.message as String?);
      if (!resp.isSuccess) throw Exception(resp.message);

      final list = resp.result.commissions;
      _commissionList = refresh ? list : [..._commissionList, ...list];
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> terminateCommission(int chatId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .terminateCommission(chatId: chatId);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCommission(int commissionId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .updateCommission(commissionId: commissionId);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkCommission(int commissionId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .checkCommission(commissionId: commissionId);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
