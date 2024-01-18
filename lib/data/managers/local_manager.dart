import 'dart:math';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/chosen_character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalManagerImpl {
  late Box<CharacterLocalModel> _charactersBox;
  late Box<ChosenCharacterLocalModel> _chosenCharactersBox;
  late Box<GuessesAmountModel> _guessesAmountBox;

  Future<ResponseModel<void>> saveCharacters(List<CharacterLocalModel> characters) async {
    try {
      Map<String, CharacterLocalModel> characterMap = {
        for (var character in characters) character.id!: character
      };
      await _charactersBox.putAll(characterMap);
      return ResponseModel(
        isError: false,
      );
    } catch (error) {
      return ResponseModel(
        errorMessage: error.toString(),
        isError: true,
      );
    }
  }

  Future<bool> isBoxEmpty() async {
    _charactersBox = await Hive.openBox<CharacterLocalModel>('characters');
    return _charactersBox.isEmpty;
  }

  Future<ResponseModel<CharacterLocalModel?>> getRandomCharacter() async {
    try {
      var rng = Random();
      int index = rng.nextInt(_charactersBox.length);
      CharacterLocalModel? c = _charactersBox.getAt(index);

      return ResponseModel(
        result: c,
        isError: false,
      );
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }

  Future<ResponseModel<ChosenCharacterLocalModel?>> getChosenCharacter(String id) async {
    try {
      ChosenCharacterLocalModel? c = _chosenCharactersBox.get(id);
      return ResponseModel(
        result: c,
        isError: false,
      );
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }

  Future<ResponseModel<bool>> editChosenCharacter(ChosenCharacterLocalModel character) async {
    try {
      await _chosenCharactersBox.delete(character.id);
      await _chosenCharactersBox.put(character.id, character);
      return ResponseModel(
        result: true,
        isError: false,
      );
    } catch (e) {
      return ResponseModel(errorMessage: e.toString(), isError: true, result: false);
    }
  }

  Future<ResponseModel<bool>> saveChosenCharacter(ChosenCharacterLocalModel character) async {
    try {
      await _chosenCharactersBox.put(character.id, character);
      return ResponseModel(
        result: true,
        isError: false,
      );
    } catch (e) {
      return ResponseModel(errorMessage: e.toString(), isError: true, result: false);
    }
  }

  Future<ResponseModel<bool>> isBoxContainsCharacter(String id) async {
    _chosenCharactersBox = await Hive.openBox<ChosenCharacterLocalModel>('_chosenCharactersBox');

    try {
      if (_chosenCharactersBox.isOpen) {
        return ResponseModel(result: _chosenCharactersBox.containsKey(id), isError: false);
      } else {
        return ResponseModel(result: _chosenCharactersBox.containsKey(id), isError: false);
      }
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }

  Future<ResponseModel<GuessesAmountModel>> getTotalGuesses() async {
    _guessesAmountBox = await Hive.openBox<GuessesAmountModel>('_guessesAmountBox');

    try {
      if (_guessesAmountBox.isEmpty) {
        _guessesAmountBox.put('guesses', GuessesAmountModel(total: 0, success: 0, failed: 0));
        return ResponseModel(
            isError: false, result: GuessesAmountModel(total: 0, success: 0, failed: 0));
      } else {
        return ResponseModel(isError: false, result: _guessesAmountBox.getAt(0));
      }
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }

  Future<ResponseModel<void>> saveTotalGuesses(GuessesAmountModel g) async {
    try {
      _guessesAmountBox.deleteAt(0);
      _guessesAmountBox.put('guesses', g);
      return ResponseModel(
        isError: false,
      );
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }

  Future<ResponseModel<void>> deleteCharacter(String id) async {
    try {
      _charactersBox.delete(id);
      return ResponseModel(
        isError: false,
      );
    } catch (e) {
      return ResponseModel(
        errorMessage: e.toString(),
        isError: true,
      );
    }
  }
}
