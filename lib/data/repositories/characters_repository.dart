import 'package:hogwarts_magic_hat_app/data/managers/network_manager.dart';
import 'package:hogwarts_magic_hat_app/data/models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/network_response_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class CharactersRepository {
  final NetworkManagerImpl manager;

  CharactersRepository(this.manager);

  Future<NetworkResponseModel<List<CharacterModel?>>> getCharacters() => manager.getCharacters();
}
