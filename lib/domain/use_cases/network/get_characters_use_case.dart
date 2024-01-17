import 'package:hogwarts_magic_hat_app/data/models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/network_response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharactersUseCase {
  final CharactersRepository charactersRepository;

  GetCharactersUseCase(this.charactersRepository);

  Future<NetworkResponseModel<List<CharacterModel?>>> execute() =>
      charactersRepository.getCharacters();
}
