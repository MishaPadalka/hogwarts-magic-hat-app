import 'package:hive/hive.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/wand_local_model.dart';

part 'chosen_character_local_model.g.dart';

@HiveType(typeId: 3)
class ChosenCharacterLocalModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<String>? alternateNames;
  @HiveField(3)
  String? species;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? house;
  @HiveField(6)
  String? dateOfBirth;
  @HiveField(7)
  int? yearOfBirth;
  @HiveField(8)
  bool? wizard;
  @HiveField(9)
  String? ancestry;
  @HiveField(10)
  String? eyeColour;
  @HiveField(11)
  String? hairColour;
  @HiveField(12)
  WandLocalModel? wand;
  @HiveField(13)
  String? patronus;
  @HiveField(14)
  bool? hogwartsStudent;
  @HiveField(15)
  bool? hogwartsStaff;
  @HiveField(16)
  String? actor;
  @HiveField(17)
  List<String>? alternateActors;
  @HiveField(18)
  bool? alive;
  @HiveField(19)
  String? image;
  @HiveField(20)
  int? attempts;
  @HiveField(21)
  bool? guessed;

  ChosenCharacterLocalModel({
    this.id,
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
    this.image,
    this.attempts,
    this.guessed,
  });
}
