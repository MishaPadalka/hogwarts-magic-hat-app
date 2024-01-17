import 'package:json_annotation/json_annotation.dart';

part 'wand_model.g.dart';

@JsonSerializable()
class Wand {
  @JsonKey(name: 'wood')
  String? wood;
  @JsonKey(name: 'core')
  String? core;
  @JsonKey(name: 'length')
  double? length;

  Wand({this.wood, this.core, this.length});

  factory Wand.fromJson(Map<String, dynamic> json) => _$WandFromJson(json);

  Map<String, dynamic> toJson() => _$WandToJson(this);
}
