import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCharacterUseCase {
  final CharactersRepository charactersRepository;

  DeleteCharacterUseCase(this.charactersRepository);

  Future<ResponseModel<void>> execute(String id) =>
      charactersRepository.deleteCharacter(id);
}
