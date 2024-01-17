import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IsBoxEmptyUseCase {
  final CharactersRepository charactersRepository;

  IsBoxEmptyUseCase(this.charactersRepository);

  Future<bool> execute() => charactersRepository.isBoxEmpty();
}
