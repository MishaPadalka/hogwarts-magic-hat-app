import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveTotalGuessesUseCase {
  final CharactersRepository charactersRepository;

  SaveTotalGuessesUseCase(this.charactersRepository);

  Future<ResponseModel<void>> execute(GuessesAmountModel g) =>
      charactersRepository.saveTotalGuesses(g);
}
