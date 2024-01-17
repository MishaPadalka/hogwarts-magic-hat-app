import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalManagerImpl {
  late Box<CharacterLocalModel> _charactersBox;

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
    _charactersBox.clear();
    return _charactersBox.isEmpty;
  }
}
