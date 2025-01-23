import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_response_model.freezed.dart';
part 'commission_response_model.g.dart';



@freezed
class CommissionResponseModel with _$CommissionResponseModel {
  factory CommissionResponseModel({
    required int commissionId,
    required String createdDate,
    required String status,
    required CommissionModel commission
  }) = _CommissionResponseModel;

  factory CommissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionResponseModelFromJson(json);
}


@JsonSerializable()
class CommissionModel {
  final int directorId;
  final BasicInfo basicInfo;
  final DesiredStyle style;
  final OtherMatters otherMatters;

  CommissionModel({
    this.directorId = 0,
    required this.basicInfo,
    required this.style,
    required this.otherMatters,
  });

  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommissionModelToJson(this);

  static CommissionModel defaultValue() {
    return CommissionModel(
      directorId: 0,
      basicInfo: BasicInfo.defaultValue(),
      style: DesiredStyle.defaultValue(),
      otherMatters: OtherMatters.defaultValue(),
    );
  }

  CommissionModel copyWith({
    int? directorId,
    BasicInfo? basicInfo,
    DesiredStyle? style,
    OtherMatters? otherMatters,
  }) {
    return CommissionModel(
      directorId: directorId ?? this.directorId,
      basicInfo: basicInfo ?? this.basicInfo,
      style: style ?? this.style,
      otherMatters: otherMatters ?? this.otherMatters,
    );
  }
}

@JsonSerializable()
class BasicInfo {
  final int height;
  final int weight;
  final String topSize;
  final String bottomSize;
  final int postalCode;
  final String address;
  final String detailAddress;
  final String text;
  final InfoStyle infoStyle;
  final InfoFit infoFit;
  final InfoMaterial infoMaterial;
  final InfoBodyType infoBodyType;

  BasicInfo({
    required this.height,
    required this.weight,
    required this.topSize,
    required this.bottomSize,
    this.postalCode = 0,
    this.address = '',
    this.detailAddress = '',
    required this.text,
    required this.infoStyle,
    required this.infoFit,
    required this.infoMaterial,
    required this.infoBodyType,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BasicInfoToJson(this);

  static BasicInfo defaultValue() {
    return BasicInfo(
      height: 0,
      weight: 0,
      topSize: '',
      bottomSize: '',
      postalCode: 0,
      address: '',
      detailAddress: '',
      text: '',
      infoStyle: InfoStyle.defaultValue(),
      infoFit: InfoFit.defaultValue(),
      infoMaterial: InfoMaterial.defaultValue(),
      infoBodyType: InfoBodyType.defaultValue(),
    );
  }

  BasicInfo copyWith({
    int? height,
    int? weight,
    String? topSize,
    String? bottomSize,
    int? postalCode,
    String? address,
    String? detailAddress,
    String? text,
    InfoStyle? infoStyle,
    InfoFit? infoFit,
    InfoMaterial? infoMaterial,
    InfoBodyType? infoBodyType,
  }) {
    return BasicInfo(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      topSize: topSize ?? this.topSize,
      bottomSize: bottomSize ?? this.bottomSize,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
      detailAddress: detailAddress ?? this.detailAddress,
      text: text ?? this.text,
      infoStyle: infoStyle ?? this.infoStyle,
      infoFit: infoFit ?? this.infoFit,
      infoMaterial: infoMaterial ?? this.infoMaterial,
      infoBodyType: infoBodyType ?? this.infoBodyType,
    );
  }
}

@JsonSerializable()
class InfoStyle {
  final List<String> preferredStyleList;
  final List<String> nonPreferredStyleList;

  InfoStyle({
    this.preferredStyleList = const [],
    this.nonPreferredStyleList = const [],
  });

  factory InfoStyle.fromJson(Map<String, dynamic> json) =>
      _$InfoStyleFromJson(json);
  Map<String, dynamic> toJson() => _$InfoStyleToJson(this);

  static InfoStyle defaultValue() {
    return InfoStyle(
      preferredStyleList: [],
      nonPreferredStyleList: [],
    );
  }

  InfoStyle copyWith({
    List<String>? preferredStyleList,
    List<String>? nonPreferredStyleList,
  }) {
    return InfoStyle(
      preferredStyleList: preferredStyleList ?? this.preferredStyleList,
      nonPreferredStyleList: nonPreferredStyleList ?? this.nonPreferredStyleList,
    );
  }
}

@JsonSerializable()
class InfoFit {
  final List<String> preferredFitList;
  final List<String> nonPreferredFitList;

  InfoFit({
    this.preferredFitList = const [],
    this.nonPreferredFitList = const [],
  });

  factory InfoFit.fromJson(Map<String, dynamic> json) =>
      _$InfoFitFromJson(json);
  Map<String, dynamic> toJson() => _$InfoFitToJson(this);

  static InfoFit defaultValue() {
    return InfoFit(
      preferredFitList: [],
      nonPreferredFitList: [],
    );
  }

  InfoFit copyWith({
    List<String>? preferredFitList,
    List<String>? nonPreferredFitList,
  }) {
    return InfoFit(
      preferredFitList: preferredFitList ?? this.preferredFitList,
      nonPreferredFitList: nonPreferredFitList ?? this.nonPreferredFitList,
    );
  }
}

@JsonSerializable()
class InfoMaterial {
  final List<String> preferredMaterialList;
  final List<String> nonPreferredMaterialList;

  InfoMaterial({
    this.preferredMaterialList = const [],
    this.nonPreferredMaterialList = const [],
  });

  factory InfoMaterial.fromJson(Map<String, dynamic> json) =>
      _$InfoMaterialFromJson(json);
  Map<String, dynamic> toJson() => _$InfoMaterialToJson(this);

  static InfoMaterial defaultValue() {
    return InfoMaterial(
      preferredMaterialList: [],
      nonPreferredMaterialList: [],
    );
  }

  InfoMaterial copyWith({
    List<String>? preferredMaterialList,
    List<String>? nonPreferredMaterialList,
  }) {
    return InfoMaterial(
      preferredMaterialList: preferredMaterialList ?? this.preferredMaterialList,
      nonPreferredMaterialList: nonPreferredMaterialList ?? this.nonPreferredMaterialList,
    );
  }
}

@JsonSerializable()
class InfoBodyType {
  final List<String> goodBodyTypeList;
  final List<String> badBodyTypeList;

  InfoBodyType({
    this.goodBodyTypeList = const [],
    this.badBodyTypeList = const [],
  });

  factory InfoBodyType.fromJson(Map<String, dynamic> json) =>
      _$InfoBodyTypeFromJson(json);
  Map<String, dynamic> toJson() => _$InfoBodyTypeToJson(this);

  static InfoBodyType defaultValue() {
    return InfoBodyType(
      goodBodyTypeList: [],
      badBodyTypeList: [],
    );
  }

  InfoBodyType copyWith({
    List<String>? goodBodyTypeList,
    List<String>? badBodyTypeList,
  }) {
    return InfoBodyType(
      goodBodyTypeList: goodBodyTypeList ?? this.goodBodyTypeList,
      badBodyTypeList: badBodyTypeList ?? this.badBodyTypeList,
    );
  }
}

@JsonSerializable()
class DesiredStyle {
  // final String occasion;
  final StyleList styleList;
  final FitList fitList;
  final MaterialList materialList;
  final ColorList colorList;

  DesiredStyle({
    // required this.occasion,
    required this.styleList,
    required this.fitList,
    required this.materialList,
    required this.colorList,
  });

  factory DesiredStyle.fromJson(Map<String, dynamic> json) =>
      _$DesiredStyleFromJson(json);
  Map<String, dynamic> toJson() => _$DesiredStyleToJson(this);

  static DesiredStyle defaultValue() {
    return DesiredStyle(
      // occasion: '',
      styleList: StyleList.defaultValue(),
      fitList: FitList.defaultValue(),
      materialList: MaterialList.defaultValue(),
      colorList: ColorList.defaultValue(),
    );
  }

  DesiredStyle copyWith({
    // String? occasion,
    StyleList? styleList,
    FitList? fitList,
    MaterialList? materialList,
    ColorList? colorList,
  }) {
    return DesiredStyle(
      // occasion: occasion ?? this.occasion,
      styleList: styleList ?? this.styleList,
      fitList: fitList ?? this.fitList,
      materialList: materialList ?? this.materialList,
      colorList: colorList ?? this.colorList,
    );
  }
}

@JsonSerializable()
class StyleList {
  final List<String> styleList;

  StyleList({required this.styleList});

  factory StyleList.fromJson(Map<String, dynamic> json) =>
      _$StyleListFromJson(json);
  Map<String, dynamic> toJson() => _$StyleListToJson(this);

  static StyleList defaultValue() {
    return StyleList(styleList: []);
  }

  StyleList copyWith({List<String>? styleList}) {
    return StyleList(styleList: styleList ?? this.styleList);
  }
}

@JsonSerializable()
class FitList {
  final List<String> fitList;

  FitList({required this.fitList});

  factory FitList.fromJson(Map<String, dynamic> json) =>
      _$FitListFromJson(json);
  Map<String, dynamic> toJson() => _$FitListToJson(this);

  static FitList defaultValue() {
    return FitList(fitList: []);
  }

  FitList copyWith({List<String>? fitList}) {
    return FitList(fitList: fitList ?? this.fitList);
  }
}

@JsonSerializable()
class MaterialList {
  final List<String> materialList;

  MaterialList({required this.materialList});

  factory MaterialList.fromJson(Map<String, dynamic> json) =>
      _$MaterialListFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialListToJson(this);

  static MaterialList defaultValue() {
    return MaterialList(materialList: []);
  }

  MaterialList copyWith({List<String>? materialList}) {
    return MaterialList(materialList: materialList ?? this.materialList);
  }
}

@JsonSerializable()
class ColorList {
  final List<String> colorList;

  ColorList({required this.colorList});

  factory ColorList.fromJson(Map<String, dynamic> json) =>
      _$ColorListFromJson(json);
  Map<String, dynamic> toJson() => _$ColorListToJson(this);

  static ColorList defaultValue() {
    return ColorList(colorList: []);
  }

  ColorList copyWith({List<String>? colorList}) {
    return ColorList(colorList: colorList ?? this.colorList);
  }
}

@JsonSerializable()
class OtherMatters {
  final int minPrice;
  final int maxPrice;
  final String dateToUse;
  final String desiredDate;
  final String text;
  final bool isShared;

  OtherMatters({
    this.minPrice = 0,
    this.maxPrice = 1000000,
    this.dateToUse = '',
    this.desiredDate = '',
    this.text = '',
    this.isShared = false,
  });

  factory OtherMatters.fromJson(Map<String, dynamic> json) =>
      _$OtherMattersFromJson(json);
  Map<String, dynamic> toJson() => _$OtherMattersToJson(this);

  static OtherMatters defaultValue() {
    return OtherMatters();
  }

  OtherMatters copyWith({
    int? minPrice,
    int? maxPrice,
    String? dateToUse,
    String? desiredDate,
    String? text,
    bool? isShared,
  }) {
    return OtherMatters(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      dateToUse: dateToUse ?? this.dateToUse,
      desiredDate: desiredDate ?? this.desiredDate,
      text: text ?? this.text,
      isShared: isShared ?? this.isShared,
    );
  }
}

//
// @JsonSerializable()
// class CommissionModel {
//   final int directorId;
//   final BasicInfo basicInfo;
//   final DesiredStyle desiredStyle;
//   final OtherMatters otherMatters;
//
//   CommissionModel({
//     this.directorId = 0,
//     required this.basicInfo,
//     required this.desiredStyle,
//     required this.otherMatters,
//   });
//
//   factory CommissionModel.fromJson(Map<String, dynamic> json) =>
//       _$CommissionModelFromJson(json);
//   Map<String, dynamic> toJson() => _$CommissionModelToJson(this);
//
//   static CommissionModel defaultValue() {
//     return CommissionModel(
//       directorId: 0,
//       basicInfo: BasicInfo.defaultValue(),
//       desiredStyle: DesiredStyle.defaultValue(),
//       otherMatters: OtherMatters.defaultValue(),
//     );
//   }
//
//   CommissionModel copyWith({
//     int? directorId,
//     BasicInfo? basicInfo,
//     DesiredStyle? desiredStyle,
//     OtherMatters? otherMatters,
//   }) {
//     return CommissionModel(
//       directorId: directorId ?? this.directorId,
//       basicInfo: basicInfo ?? this.basicInfo,
//       desiredStyle: desiredStyle ?? this.desiredStyle,
//       otherMatters: otherMatters ?? this.otherMatters,
//     );
//   }
// }
// @freezed
// class BasicInfo with _$BasicInfo {
//   factory BasicInfo({
//     required int height,
//     required int weight,
//     required String topSize,
//     required String bottomSize,
//     @Default(0) int postalCode,
//     @Default('') String address,
//     @Default('') String detailAddress,
//     required String text,
//     required InfoStyle infoStyle,
//     required InfoFit infoFit,
//     required InfoMaterial infoMaterial,
//     required InfoBodyType infoBodyType,
//   }) = _BasicInfo;
//
//   factory BasicInfo.fromJson(Map<String, dynamic> json) =>
//       _$BasicInfoFromJson(json);
//
//   static BasicInfo defaultValue() {
//     return BasicInfo(
//       height: 0,
//       weight: 0,
//       topSize: '',
//       bottomSize: '',
//       postalCode: 0,
//       address: '',
//       detailAddress: '',
//       text: '',
//       infoStyle: InfoStyle.defaultValue(),
//       infoFit: InfoFit.defaultValue(),
//       infoMaterial: InfoMaterial.defaultValue(),
//       infoBodyType: InfoBodyType.defaultValue(),
//     );
//   }
// }
//
// @freezed
// class InfoStyle with _$InfoStyle {
//   factory InfoStyle({
//     @Default([]) List<String> preferredStyleList,
//     @Default([]) List<String> nonPreferredStyleList,
//   }) = _InfoStyle;
//
//   factory InfoStyle.fromJson(Map<String, dynamic> json) =>
//       _$InfoStyleFromJson(json);
//
//   static InfoStyle defaultValue() {
//     return InfoStyle(
//       preferredStyleList: [],
//       nonPreferredStyleList: [],
//     );
//   }
// }
//
// @freezed
// class InfoFit with _$InfoFit {
//   factory InfoFit({
//     @Default([]) List<String> preferredFitList,
//     @Default([]) List<String> nonPreferredFitList,
//   }) = _InfoFit;
//
//   factory InfoFit.fromJson(Map<String, dynamic> json) =>
//       _$InfoFitFromJson(json);
//
//   static InfoFit defaultValue() {
//     return InfoFit(
//       preferredFitList: [],
//       nonPreferredFitList: [],
//     );
//   }
// }
//
// @freezed
// class InfoMaterial with _$InfoMaterial {
//   factory InfoMaterial({
//     @Default([]) List<String> preferredMaterialList,
//     @Default([]) List<String> nonPreferredMaterialList,
//   }) = _InfoMaterial;
//
//   factory InfoMaterial.fromJson(Map<String, dynamic> json) =>
//       _$InfoMaterialFromJson(json);
//
//   static InfoMaterial defaultValue() {
//     return InfoMaterial(
//       preferredMaterialList: [],
//       nonPreferredMaterialList: [],
//     );
//   }
// }
//
// @freezed
// class InfoBodyType with _$InfoBodyType {
//   factory InfoBodyType({
//     @Default([]) List<String> goodBodyTypeList,
//     @Default([]) List<String> badBodyTypeList,
//   }) = _InfoBodyType;
//
//   factory InfoBodyType.fromJson(Map<String, dynamic> json) =>
//       _$InfoBodyTypeFromJson(json);
//
//   static InfoBodyType defaultValue() {
//     return InfoBodyType(
//       goodBodyTypeList: [],
//       badBodyTypeList: [],
//     );
//   }
// }
//
// @freezed
// class DesiredStyle with _$DesiredStyle {
//   factory DesiredStyle({
//     required String occasion,
//     required StyleList styleList,
//     required FitList fitList,
//     required MaterialList materialList,
//     required ColorList colorList,
//   }) = _DesiredStyle;
//
//   factory DesiredStyle.fromJson(Map<String, dynamic> json) =>
//       _$DesiredStyleFromJson(json);
//
//   static DesiredStyle defaultValue() {
//     return DesiredStyle(
//       occasion: '',
//       styleList: StyleList.defaultValue(),
//       fitList: FitList.defaultValue(),
//       materialList: MaterialList.defaultValue(),
//       colorList: ColorList.defaultValue(),
//     );
//   }
// }
//
// @freezed
// class StyleList with _$StyleList {
//   factory StyleList({
//     required List<String> styleList,
//   }) = _StyleList;
//
//   factory StyleList.fromJson(Map<String, dynamic> json) =>
//       _$StyleListFromJson(json);
//
//   static StyleList defaultValue() {
//     return StyleList(styleList: []);
//   }
// }
//
// @freezed
// class FitList with _$FitList {
//   factory FitList({
//     required List<String> fitList,
//   }) = _FitList;
//
//   factory FitList.fromJson(Map<String, dynamic> json) =>
//       _$FitListFromJson(json);
//
//   static FitList defaultValue() {
//     return FitList(fitList: []);
//   }
// }
//
// @freezed
// class MaterialList with _$MaterialList {
//   factory MaterialList({
//     required List<String> materialList,
//   }) = _MaterialList;
//
//   factory MaterialList.fromJson(Map<String, dynamic> json) =>
//       _$MaterialListFromJson(json);
//
//   static MaterialList defaultValue() {
//     return MaterialList(materialList: []);
//   }
// }
//
// @freezed
// class ColorList with _$ColorList {
//   factory ColorList({
//     required List<String> colorList,
//   }) = _ColorList;
//
//   factory ColorList.fromJson(Map<String, dynamic> json) =>
//       _$ColorListFromJson(json);
//
//   static ColorList defaultValue() {
//     return ColorList(colorList: []);
//   }
// }
//
// @freezed
// class OtherMatters with _$OtherMatters {
//   factory OtherMatters({
//     @Default(0) int minPrice,
//     @Default(0) int maxPrice,
//     @Default('') String dateToUse,
//     @Default('') String desiredDate,
//     @Default('') String text,
//     @Default(false) bool isShared,
//   }) = _OtherMatters;
//
//   factory OtherMatters.fromJson(Map<String, dynamic> json) =>
//       _$OtherMattersFromJson(json);
//
//   static OtherMatters defaultValue() {
//     return OtherMatters(
//       minPrice: 0,
//       maxPrice: 0,
//       dateToUse: '',
//       desiredDate: '',
//       text: '',
//       isShared: false,
//     );
//   }
// }



