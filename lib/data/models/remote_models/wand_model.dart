import 'package:json_annotation/json_annotation.dart';

part 'wand_model.g.dart';

@JsonSerializable()
class WandModel {
  @JsonKey(name: 'wood')
  String? wood;
  @JsonKey(name: 'core')
  String? core;
  @JsonKey(name: 'length')
  double? length;

  WandModel({this.wood, this.core, this.length});

  factory WandModel.fromJson(Map<String, dynamic> json) => _$WandModelFromJson(json);

  Map<String, dynamic> toJson() => _$WandModelToJson(this);
}
