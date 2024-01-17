import 'package:dio/dio.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRandomCharacterUseCase {
  final CharactersRepository charactersRepository;

  GetRandomCharacterUseCase(this.charactersRepository);

  Future<ResponseModel<CharacterLocalModel?>> execute() => charactersRepository.getRandomCharacter();
}
