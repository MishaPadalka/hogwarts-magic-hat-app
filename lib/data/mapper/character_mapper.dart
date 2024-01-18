import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/chosen_character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/wand_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/wand_model.dart';

CharacterLocalModel mapCharacterModelToCharacterLocalModel(CharacterModel response) =>
    CharacterLocalModel(
      id: response.id,
      name: response.name,
      alternateNames: response.alternateNames,
      image: response.image,
      species: response.species,
      gender: response.gender,
      dateOfBirth: response.dateOfBirth,
      yearOfBirth: response.yearOfBirth,
      house: response.house,
      wizard: response.wizard,
      actor: response.actor,
      alive: response.alive,
      alternateActors: response.alternateActors,
      ancestry: response.ancestry,
      hairColour: response.hairColour,
      hogwartsStaff: response.hogwartsStaff,
      hogwartsStudent: response.hogwartsStudent,
      patronus: response.patronus,
      eyeColour: response.eyeColour,
      wand: mapWandModelToWandLocalModel(response.wand!),
    );

List<CharacterLocalModel> mapListCharacterModelToListCharacterLocalModel(
        List<CharacterModel> responseList) =>
    responseList.map(mapCharacterModelToCharacterLocalModel).toList();

WandLocalModel mapWandModelToWandLocalModel(WandModel response) => WandLocalModel(
      wood: response.wood,
      core: response.core,
      length: response.length,
    );

ChosenCharacterLocalModel mapCharacterToChosenCharacter(
        CharacterLocalModel response, int attempts, bool guessed) =>
    (ChosenCharacterLocalModel(
      id: response.id,
      name: response.name,
      alternateNames: response.alternateNames,
      image: response.image,
      species: response.species,
      gender: response.gender,
      dateOfBirth: response.dateOfBirth,
      yearOfBirth: response.yearOfBirth,
      house: response.house,
      wizard: response.wizard,
      actor: response.actor,
      alive: response.alive,
      alternateActors: response.alternateActors,
      ancestry: response.ancestry,
      hairColour: response.hairColour,
      hogwartsStaff: response.hogwartsStaff,
      hogwartsStudent: response.hogwartsStudent,
      patronus: response.patronus,
      eyeColour: response.eyeColour,
      wand: response.wand,
      attempts: attempts,
      guessed: guessed,
    ));
