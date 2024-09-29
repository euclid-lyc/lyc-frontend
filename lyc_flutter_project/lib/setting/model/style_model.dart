import 'package:json_annotation/json_annotation.dart';

part 'style_model.g.dart';

@JsonSerializable()
class StyleModel {
  final SpecModel spec;
  final StyleListModel preferredStyle;
  final StyleListModel nonPreferredStyle;
  @JsonKey(name: 'preferredMaterial', fromJson: _materialsFromJson, toJson: _materialsToJson)
  final List<String> preferredMaterials;
  @JsonKey(name: 'nonPreferredMaterial', fromJson: _materialsFromJson, toJson: _materialsToJson)
  final List<String> nonPreferredMaterials;
  @JsonKey(name: 'preferredFit', fromJson: _fitsFromJson, toJson: _fitsToJson)
  final List<String> preferredFits;
  @JsonKey(name: 'nonPreferredFit', fromJson: _fitsFromJson, toJson: _fitsToJson)
  final List<String> nonPreferredFits;
  @JsonKey(name: 'goodBodyType', fromJson: _bodyTypesFromJson, toJson: _bodyTypesToJson)
  final List<String> goodBodyTypes;
  @JsonKey(name: 'badBodyType', fromJson: _bodyTypesFromJson, toJson: _bodyTypesToJson)
  final List<String> badBodyTypes;
  final String details;

  const StyleModel({
    required this.spec,
    required this.preferredStyle,
    required this.nonPreferredStyle,
    required this.preferredMaterials,
    required this.nonPreferredMaterials,
    required this.preferredFits,
    required this.nonPreferredFits,
    required this.goodBodyTypes,
    required this.badBodyTypes,
    required this.details,
  });

  factory StyleModel.fromJson(Map<String, dynamic> json)
  => _$StyleModelFromJson(json);

  Map<String, dynamic> toJson() => _$StyleModelToJson(this);

  static List<String> _materialsFromJson(Map<String, dynamic> json) =>
      List<String>.from(json['materials']);
  static Map<String, dynamic> _materialsToJson(List<String> list) =>
      {'materials': list};

  static List<String> _fitsFromJson(Map<String, dynamic> json) =>
      List<String>.from(json['fits']);
  static Map<String, dynamic> _fitsToJson(List<String> list) =>
      {'fits': list};

  static List<String> _bodyTypesFromJson(Map<String, dynamic> json) =>
      List<String>.from(json['bodyTypes']);
  static Map<String, dynamic> _bodyTypesToJson(List<String> list) =>
      {'bodyTypes': list};
}

@JsonSerializable()
class SpecModel {
  final int height;
  final int weight;
  final String topSize;
  final String bottomSize;

  const SpecModel({
    required this.height,
    required this.weight,
    required this.topSize,
    required this.bottomSize,
  });

  factory SpecModel.fromJson(Map<String, dynamic> json) =>
      _$SpecModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecModelToJson(this);
}

@JsonSerializable()
class StyleListModel {
  final String occasion;
  @JsonKey(name: 'styleList', fromJson: _listFromJson, toJson: _listToJson)
  final List<String> styles;
  @JsonKey(name: 'fitList', fromJson: _listFromJson, toJson: _listToJson)
  final List<String> fits;
  @JsonKey(name: 'materialList', fromJson: _listFromJson, toJson: _listToJson)
  final List<String> materials;
  @JsonKey(name: 'colorList', fromJson: _listFromJson, toJson: _listToJson)
  final List<String> colors;

  const StyleListModel({
    required this.occasion,
    required this.styles,
    required this.fits,
    required this.materials,
    required this.colors,
  });

  factory StyleListModel.fromJson(Map<String, dynamic> json) => _$StyleListModelFromJson(json);

  Map<String, dynamic> toJson() => _$StyleListModelToJson(this);

  static List<String> _listFromJson(Map<String, dynamic> json) =>
      List<String>.from(json.values.first);
  static Map<String, List<String>> _listToJson(List<String> list) =>
      {list.first: list};
}