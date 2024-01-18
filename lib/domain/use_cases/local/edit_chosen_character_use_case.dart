import 'package:hogwarts_magic_hat_app/data/models/local_models/chosen_character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditChosenCharacterUseCase {
  final CharactersRepository charactersRepository;

  EditChosenCharacterUseCase(this.charactersRepository);

  Future<ResponseModel<bool>> execute(ChosenCharacterLocalModel character) =>
      charactersRepository.editChosenCharacter(character);
}
