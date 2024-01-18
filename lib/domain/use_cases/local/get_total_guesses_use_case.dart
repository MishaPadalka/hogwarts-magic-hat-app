import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTotalGuessesUseCase {
  final CharactersRepository charactersRepository;

  GetTotalGuessesUseCase(this.charactersRepository);

  Future<ResponseModel<GuessesAmountModel>> execute() => charactersRepository.getTotalGuesses();
}
