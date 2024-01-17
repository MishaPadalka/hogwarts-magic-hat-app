import 'package:hogwarts_magic_hat_app/data/managers/local_manager.dart';
import 'package:hogwarts_magic_hat_app/data/managers/network_manager.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
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
  Future<ResponseModel<CharacterLocalModel?>> getRandomCharacter() => localManager.getRandomCharacter();

}
