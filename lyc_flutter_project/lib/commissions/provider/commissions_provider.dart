import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/commissions/model/commission_model.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import '../repository/commissions_repository.dart';
import 'package:intl/intl.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepositoryProvider repositoryProvider;

  CommissionsProvider({required this.repositoryProvider});

  bool _isLoading = false;

  List<CommissionResult> _commissionList = [];
  bool get isLoading => _isLoading;

  get commissionList => _commissionList;

  CommissionModel model = CommissionModel.defaultValue();

  Future<void> createCommission() async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .createCommission(commissionModel: model);
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
        final lastCreatedAt = _commissionList.isNotEmpty
            ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(
          _commissionList[_commissionList.length - 1].createdAt,
        )
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSS").format(DateTime.now());
        final resp = await repositoryProvider.commissionsRepository
            .getCommissionList(pageSize: pageSize, dateTime: lastCreatedAt);


        if (!resp.isSuccess) throw Exception(resp.message);

       //todo refresh일 경우와 그냥 구분하기
        _commissionList = resp.result;


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
