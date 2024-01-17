import 'package:hogwarts_magic_hat_app/data/models/remote_models/wand_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'alternate_names')
  List<String>? alternateNames;
  @JsonKey(name: 'species')
  String? species;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'house')
  String? house;
  @JsonKey(name: 'dateOfBirth')
  String? dateOfBirth;
  @JsonKey(name: 'yearOfBirth')
  int? yearOfBirth;
  @JsonKey(name: 'wizard')
  bool? wizard;
  @JsonKey(name: 'ancestry')
  String? ancestry;
  @JsonKey(name: 'eyeColour')
  String? eyeColour;
  @JsonKey(name: 'hairColour')
  String? hairColour;
  @JsonKey(name: 'wand')
  WandModel? wand;
  @JsonKey(name: 'patronus')
  String? patronus;
  @JsonKey(name: 'hogwartsStudent')
  bool? hogwartsStudent;
  @JsonKey(name: 'hogwartsStaff')
  bool? hogwartsStaff;
  @JsonKey(name: 'actor')
  String? actor;
  @JsonKey(name: 'alternate_actors')
  List<String>? alternateActors;
  @JsonKey(name: 'alive')
  bool? alive;
  @JsonKey(name: 'image')
  String? image;

  CharacterModel(
      {this.id,
      this.name,
      this.alternateNames,
      this.species,
      this.gender,
      this.house,
      this.dateOfBirth,
      this.yearOfBirth,
      this.wizard,
      this.ancestry,
      this.eyeColour,
      this.hairColour,
      this.wand,
      this.patronus,
      this.hogwartsStudent,
      this.hogwartsStaff,
      this.actor,
      this.alternateActors,
      this.alive,
      this.image});
  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
