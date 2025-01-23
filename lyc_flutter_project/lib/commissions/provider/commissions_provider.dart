import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/commissions/model/commission_model.dart';
import 'package:lyc_flutter_project/commissions/model/commission_response.dart';
import '../model/commission_response_model.dart' as commissions;
import '../repository/commissions_repository.dart';
import 'package:intl/intl.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepositoryProvider repositoryProvider;

  CommissionsProvider({required this.repositoryProvider});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<CommissionResponse> _commissionList = [];

  List<CommissionResponse> get commissionList => _commissionList;

  CommissionModel _model = CommissionModel.defaultValue();

  CommissionModel get model => _model;
  set model(CommissionModel model){
    _model = model;
  }


  void updateHeight({required int height}) {
    _model.copyWith(basicInfo: _model.basicInfo.copyWith(height: height));
  }
  void updateWeight({required int weight}) {
    _model.copyWith(basicInfo: _model.basicInfo.copyWith(weight: weight));
  }
  void updateTopSize({required int topSize}) {
    _model.copyWith(basicInfo: _model.basicInfo.copyWith(topSize: topSize.toString()));
  }
  void updateBottomSize({required int bottomSize}) {
    _model.copyWith(basicInfo: _model.basicInfo.copyWith(bottomSize: bottomSize.toString()));
  }


  void updateText({required String text}) {
    _model.copyWith(basicInfo: _model.basicInfo.copyWith(text:text));
  }
  void updatePreferredStyle({required String selected}) {
    List<String> list = _model.basicInfo.infoStyle.preferredStyleList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoStyle: _model.basicInfo.infoStyle.copyWith(preferredStyleList: list)));
    notifyListeners();
  }

  void updateNonPreferredStyle({required String selected}) {
    List<String> list = _model.basicInfo.infoStyle.nonPreferredStyleList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoStyle: _model.basicInfo.infoStyle.copyWith(nonPreferredStyleList: list)));
    notifyListeners();
  }

  void updatePreferredMaterials({required String selected}) {
    List<String> list = _model.basicInfo.infoMaterial.preferredMaterialList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoMaterial: _model.basicInfo.infoMaterial.copyWith(preferredMaterialList: list)));
    notifyListeners();
  }

  void updateNonPreferredMaterials({required String selected}) {
    List<String> list = _model.basicInfo.infoMaterial.nonPreferredMaterialList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo.copyWith(
            infoMaterial: _model.basicInfo.infoMaterial.copyWith(nonPreferredMaterialList: list)));
    notifyListeners();
  }

  void updatePreferredFits({required String selected}) {
    List<String> list = _model.basicInfo.infoFit.preferredFitList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoFit: _model.basicInfo.infoFit.copyWith(preferredFitList: list)));
    notifyListeners();
  }

  void updateNonPreferredFits({required String selected}) {
    List<String> list = _model.basicInfo.infoFit.nonPreferredFitList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoFit: _model.basicInfo.infoFit.copyWith(nonPreferredFitList: list)));
    notifyListeners();
  }

  void updateBadBodyTypes({required String selected}) {
    List<String> list = _model.basicInfo.infoBodyType.badBodyTypeList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoBodyType:_model.basicInfo.infoBodyType.copyWith(badBodyTypeList: list)));
    notifyListeners();
  }

  void updateGoodBodyTypes({required String selected}) {
    List<String> list = _model.basicInfo.infoBodyType.goodBodyTypeList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        basicInfo: _model.basicInfo
            .copyWith(infoBodyType: _model.basicInfo.infoBodyType.copyWith(goodBodyTypeList:list)));
    notifyListeners();
  }

  void updateStyleList({required String selected}) {
    List<String> list = _model.desiredStyle.styleList.styleList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        desiredStyle: _model.desiredStyle
            .copyWith(styleList:_model.desiredStyle.styleList.copyWith(styleList: list)));
    notifyListeners();
  }
  void updateFitList({required String selected}) {
    List<String> list = _model.desiredStyle.fitList.fitList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        desiredStyle: _model.desiredStyle.copyWith(fitList:_model.desiredStyle.fitList.copyWith(fitList: list)));
    notifyListeners();
  }
  void updateMaterialList({required String selected}) {
    List<String> list = _model.desiredStyle.materialList.materialList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        desiredStyle: _model.desiredStyle.copyWith(materialList: _model.desiredStyle.materialList.copyWith(materialList: list)));
    notifyListeners();
  }

  void updateColorList({required String selected}) {
    List<String> list = _model.desiredStyle.colorList.colorList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _model = _model.copyWith(
        desiredStyle: _model.desiredStyle.copyWith(colorList: ColorList(colorList: list)));
    notifyListeners();
  }

  void updateMinPrice({required int minPrice}){
    _model = _model.copyWith(otherMatters: _model.otherMatters.copyWith(minPrice: minPrice));
  }

  void updateMaxPrice({required int maxPrice}){
    _model = _model.copyWith(otherMatters:_model.otherMatters.copyWith(maxPrice: maxPrice));
  }

  void updateDateToUse({required String dateToUse}) {
    _model = _model.copyWith(
      otherMatters: _model.otherMatters.copyWith(dateToUse: dateToUse)
    );
  }

  void updateDesiredDate({required String desiredDate}) {
    _model = _model.copyWith(
      otherMatters: _model.otherMatters.copyWith(desiredDate: desiredDate)
    );
  }

  void updateAdditionalText({required String text}) {
    _model = _model.copyWith(
      otherMatters: _model.otherMatters.copyWith(text: text)
    );
  }

  void updateIsShared({required bool isShared}) {
    _model = _model.copyWith(
      otherMatters: _model.otherMatters.copyWith(isShared: isShared)
    );
  }


  Future<void> createCommission() async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .createCommission(commissionModel: _model);
      _model = CommissionModel.defaultValue();
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
      debugPrint('Error: ${e.toString()}');
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

  Future<commissions.CommissionResponseModel?> getCommission(
      int commissionId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .getCommission(commissionId: commissionId);
      if (!resp.isSuccess) {
        throw Exception(resp.message);
      } else {
        return resp.result;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // void updateHeight({required String selected}) {
  //   _model= CommissionModel.copyWith(
  //     basicInfo: BasicInfo(
  //       height: int.parse(selected),
  //       weight: _model.basicInfo.weight,
  //       topSize:_model.basicInfo.topSize,
  //       bottomSize:_model.basicInfo.bottomSize
  //     ),
  //   );
  //   notifyListeners();
  // }
  //
  // void updateWeight({required String selected}) {
  //   _model= CommissionModel.copyWith(
  //     basicInfo: BasicInfo(
  //       height: _model.basicInfo.height,
  //       weight: int.parse(selected),
  //         topSize:_model.basicInfo.topSize,
  //         bottomSize:_model.basicInfo.bottomSize
  //     ),
  //   );
  //   notifyListeners();
  // }
  //
  // void updateDetails({required String text}) {
  //   _model = CommissionModel.copyWith(
  //       basicInfo: BasicInfo
  //         (height: _model.basicInfo.height, weight:_model.basicInfo.weight, topSize:_model.basicInfo.topSize,
  //           bottomSize: model.basicInfo.bottomSize, text: text,
  //           infoStyle: _model.basicInfo.infoStyle, infoFit: _model.basicInfo.infoFit,
  //           infoMaterial: _model.basicInfo.infoMaterial, infoBodyType: _model.basicInfo.infoBodyType));
  //   notifyListeners();
  // }
  //
  // void updateTopSize({required int selected}) {
  //   _topSize = selected;
  //   notifyListeners();
  // }
  //
  // void updateBottomSize({required int selected}) {
  //   _bottomSize = selected;
  //   notifyListeners();
  // }
  //
  // void rollbackTopSize() {
  //   _topSize = int.parse(_model!.spec.topSize.substring(5));
  //   notifyListeners();
  // }
  //
  // void rollbackBottomSize() {
  //   _bottomSize = int.parse(_model!.spec.bottomSize.substring(5));
  //   notifyListeners();
  // }
  //
  // void updatePreferredStyle({required String selected}) {
  //   List<String> list = _model!.preferredStyle.styles;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(preferredStyle: StyleListModel(styles: list));
  //   notifyListeners();
  // }
  //
  // void updateNonPreferredStyle({required String selected}) {
  //   List<String> list = _model!.nonPreferredStyle.styles;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(nonPreferredStyle: StyleListModel(styles: list));
  //   notifyListeners();
  // }
  //
  // void updatePreferredMaterials({required String selected}) {
  //   List<String> list = _model!.preferredMaterials.materials;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(preferredMaterials: MaterialModel(materials: list));
  //   notifyListeners();
  // }
  //
  // void updateNonPreferredMaterials({required String selected}) {
  //   List<String> list = _model!.nonPreferredMaterials.materials;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(nonPreferredMaterials: MaterialModel(materials: list));
  //   notifyListeners();
  // }
  //
  // void updatePreferredFits({required String selected}) {
  //   List<String> list = _model!.preferredFits.fits;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(preferredFits: FitModel(fits: list));
  //   notifyListeners();
  // }
  //
  // void updateNonPreferredFits({required String selected}) {
  //   List<String> list = _model!.nonPreferredFits.fits;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(nonPreferredFits: FitModel(fits: list));
  //   notifyListeners();
  // }
  //
  // void updateBadBodyTypes({required String selected}) {
  //   List<String> list = _model!.badBodyTypes.bodyTypes;
  //   if (list.contains(selected)) {
  //     list.remove(selected);
  //   } else {
  //     list.add(selected);
  //   }
  //   _model = _model!.copyWith(badBodyTypes: BodyTypeModel(bodyTypes: list));
  //   notifyListeners();
  // }

  Future<void> acceptCommission(int commissionId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .acceptCommission(commissionId: commissionId);
      if (!resp.isSuccess) {
        throw Exception(resp.message);
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> declineCommission(int commissionId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .declineCommission(commissionId: commissionId);
      if (!resp.isSuccess) {
        throw Exception(resp.message);
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
