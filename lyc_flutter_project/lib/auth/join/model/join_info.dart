class JoinInfo {
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

  JoinInfo({
    required this.height,
    required this.weight,
    required this.topSize,
    required this.bottomSize,
    required this.postalCode,
    required this.address,
    required this.detailAddress,
    required this.text,
    required this.infoStyle,
    required this.infoFit,
    required this.infoMaterial,
    required this.infoBodyType,
  });

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'topSize': topSize,
      'bottomSize': bottomSize,
      'postalCode': postalCode,
      'address': address,
      'detailAddress': detailAddress,
      'text': text,
      'infoStyle': infoStyle.toJson(),
      'infoFit': infoFit.toJson(),
      'infoMaterial': infoMaterial.toJson(),
      'infoBodyType': infoBodyType.toJson(),
    };
  }

  JoinInfo copyWith({
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
    return JoinInfo(
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

  static JoinInfo defaultValue() {
    return JoinInfo(
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
}

class InfoStyle {
  final List<String> preferredStyleList;
  final List<String> nonPreferredStyleList;

  InfoStyle({
    required this.preferredStyleList,
    required this.nonPreferredStyleList,
  });

  Map<String, dynamic> toJson() {
    return {
      'preferredStyleList': preferredStyleList,
      'nonPreferredStyleList': nonPreferredStyleList,
    };
  }

  InfoStyle copyWith({
    List<String>? preferredStyleList,
    List<String>? nonPreferredStyleList,
  }) {
    return InfoStyle(
      preferredStyleList: preferredStyleList ?? this.preferredStyleList,
      nonPreferredStyleList:
          nonPreferredStyleList ?? this.nonPreferredStyleList,
    );
  }

  static InfoStyle defaultValue() {
    return InfoStyle(
      preferredStyleList: [],
      nonPreferredStyleList: [],
    );
  }
}

class InfoFit {
  final List<String> preferredFitList;
  final List<String> nonPreferredFitList;

  InfoFit({
    required this.preferredFitList,
    required this.nonPreferredFitList,
  });

  Map<String, dynamic> toJson() {
    return {
      'preferredFitList': preferredFitList,
      'nonPreferredFitList': nonPreferredFitList,
    };
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

  static InfoFit defaultValue() {
    return InfoFit(
      preferredFitList: [],
      nonPreferredFitList: [],
    );
  }
}

class InfoMaterial {
  final List<String> preferredMaterialList;
  final List<String> nonPreferredMaterialList;

  InfoMaterial({
    required this.preferredMaterialList,
    required this.nonPreferredMaterialList,
  });

  Map<String, dynamic> toJson() {
    return {
      'preferredMaterialList': preferredMaterialList,
      'nonPreferredMaterialList': nonPreferredMaterialList,
    };
  }

  InfoMaterial copyWith({
    List<String>? preferredMaterialList,
    List<String>? nonPreferredMaterialList,
  }) {
    return InfoMaterial(
      preferredMaterialList:
          preferredMaterialList ?? this.preferredMaterialList,
      nonPreferredMaterialList:
          nonPreferredMaterialList ?? this.nonPreferredMaterialList,
    );
  }

  static InfoMaterial defaultValue() {
    return InfoMaterial(
      preferredMaterialList: [],
      nonPreferredMaterialList: [],
    );
  }
}

class InfoBodyType {
  final List<String> goodBodyTypeList;
  final List<String> badBodyTypeList;

  InfoBodyType({
    required this.goodBodyTypeList,
    required this.badBodyTypeList,
  });

  Map<String, dynamic> toJson() {
    return {
      'goodBodyTypeList': goodBodyTypeList,
      'badBodyTypeList': badBodyTypeList,
    };
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

  static InfoBodyType defaultValue() {
    return InfoBodyType(
      goodBodyTypeList: [],
      badBodyTypeList: [],
    );
  }
}
