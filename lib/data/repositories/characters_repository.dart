import 'package:hogwarts_magic_hat_app/data/managers/local_manager.dart';
import 'package:hogwarts_magic_hat_app/data/managers/network_manager.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/chosen_character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class CharactersRepository {
  final NetworkManagerImpl networkManager;
  final LocalManagerImpl localManager;

  CharactersRepository(this.networkManager, this.localManager);

  Future<ResponseModel<List<CharacterLocalModel>>> getCharacters() =>
      networkManager.getCharacters();

  Future<ResponseModel<void>> saveCharacters(List<CharacterLocalModel> localCharacters) =>
      localManager.saveCharacters(localCharacters);

  Future<bool> isBoxEmpty() => localManager.isBoxEmpty();

  Future<ResponseModel<CharacterLocalModel?>> getRandomCharacter() =>
      localManager.getRandomCharacter();

  Future<ResponseModel<bool>> isBoxContainsCharacter(String id) =>
      localManager.isBoxContainsCharacter(id);

  Future<ResponseModel<ChosenCharacterLocalModel?>> getChosenCharacter(String id) =>
      localManager.getChosenCharacter(id);

  Future<ResponseModel<bool>> editChosenCharacter(ChosenCharacterLocalModel character) =>
      localManager.editChosenCharacter(character);

  Future<ResponseModel<bool>> saveChosenCharacter(ChosenCharacterLocalModel character) =>
      localManager.saveChosenCharacter(character);

  Future<ResponseModel<GuessesAmountModel>> getTotalGuesses() =>
      localManager.getTotalGuesses();

  Future<ResponseModel<void>> saveTotalGuesses(GuessesAmountModel g) =>
      localManager.saveTotalGuesses(g);

  Future<ResponseModel<void>> deleteCharacter(String id) =>
      localManager.deleteCharacter(id);
}
