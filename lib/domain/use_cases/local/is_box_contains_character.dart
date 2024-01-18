import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsBoxContainsCharacter {
  final CharactersRepository charactersRepository;

  IsBoxContainsCharacter(this.charactersRepository);

  Future<ResponseModel<bool>> execute(String id) => charactersRepository.isBoxContainsCharacter(id);
}
