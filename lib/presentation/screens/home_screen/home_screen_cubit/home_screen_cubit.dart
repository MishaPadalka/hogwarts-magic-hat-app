import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_random_character_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  final GetRandomCharacterUseCase _getRandomCharacterUseCase;
  CharacterLocalModel? character;

  HomeScreenCubit(this._getRandomCharacterUseCase) : super(HomeScreenInitial());

  Future<void> getRandomCharacter() async {
    final ResponseModel<CharacterLocalModel?> r = await _getRandomCharacterUseCase.execute();
    if (r.isError || r.result == null) {
      emit(HomeScreenError(r.errorMessage!));
      return;
    }
    character = r.result!;
    _emitContentState();
  }

  void _emitContentState() {
    emit(HomeScreenContent(character!));
  }
}
