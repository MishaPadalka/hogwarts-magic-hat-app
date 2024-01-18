import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_magic_hat_app/data/mapper/character_mapper.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/chosen_character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/guesses_amount_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/delete_character_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/edit_chosen_character_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_chosen_character_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_random_character_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_total_guesses_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/is_box_contains_character.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_chosen_character_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_total_guesses_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_state.dart';

@injectable
class HomeScreenCubit extends Cubit<HomeScreenState> {
  final GetRandomCharacterUseCase _getRandomCharacterUseCase;
  final IsBoxContainsCharacter _isBoxContainsCharacter;
  final GetChosenCharacterUseCase _getChosenCharacterUseCase;
  final EditChosenCharacterUseCase _editChosenCharacterUseCase;
  final SaveChosenCharacterUseCase _saveChosenCharacterUseCase;
  final GetTotalGuessesUseCase _getTotalGuessesUseCase;
  final SaveTotalGuessesUseCase _saveTotalGuessesUseCase;
  final DeleteCharacterUseCase _deleteCharacterUseCase;
  CharacterLocalModel? character;
  GuessesAmountModel? guesses;

  HomeScreenCubit(
      this._getRandomCharacterUseCase,
      this._isBoxContainsCharacter,
      this._getChosenCharacterUseCase,
      this._editChosenCharacterUseCase,
      this._saveChosenCharacterUseCase,
      this._getTotalGuessesUseCase,
      this._saveTotalGuessesUseCase,
      this._deleteCharacterUseCase)
      : super(HomeScreenInitial()) {
    getRandomCharacter();
  }

  Future<void> getRandomCharacter() async {
    final ResponseModel<CharacterLocalModel?> r = await _getRandomCharacterUseCase.execute();
    if (r.isError || r.result == null) {
      emit(HomeScreenError(r.errorMessage!));
      return;
    }
    character = r.result!;
    final ResponseModel<GuessesAmountModel?> g = await _getTotalGuessesUseCase.execute();
    if (g.isError || g.result == null) {
      emit(HomeScreenError(r.errorMessage ?? 'Something went wrong'));
      return;
    }
    guesses = g.result;
    emit(HomeScreenEvent());
    _emitContentState();
  }

  Future<void> rightChoiceSelected(bool isRight) async {
    if (isRight) {
      guesses!.total = guesses!.total + 1;
      guesses!.success = guesses!.success + 1;
    } else {
      guesses!.total = guesses!.total + 1;
      guesses!.failed = guesses!.failed + 1;
    }
    final ResponseModel<void> t = await _saveTotalGuessesUseCase.execute(guesses!);
    if (t.isError) {
      emit(HomeScreenError(t.errorMessage!));
      return;
    }

    final ResponseModel<bool> r = await _isBoxContainsCharacter.execute(character!.id!);
    if (r.isError || r.result == null) {
      emit(HomeScreenError(r.errorMessage!));
      return;
    }
    if (r.result == true) {
      ResponseModel<ChosenCharacterLocalModel?> r =
          await _getChosenCharacterUseCase.execute(character!.id!);
      if (r.isError || r.result == null) {
        emit(HomeScreenError(r.errorMessage!));
        return;
      }
      ChosenCharacterLocalModel? g = r.result;
      g!.attempts = (g.attempts ?? 0) + 1;
      final ResponseModel<bool> f = await _editChosenCharacterUseCase.execute(g);
      if (f.isError || f.result == null) {
        emit(HomeScreenError(r.errorMessage!));
        return;
      }
    } else {
      final ResponseModel<bool> k = await _saveChosenCharacterUseCase.execute(
        mapCharacterToChosenCharacter(character!, 1, isRight),
      );
      if (k.isError || k.result == null) {
        emit(HomeScreenError(r.errorMessage!));
        return;
      }
    }
    if (isRight) {
      final ResponseModel<void> h = await _deleteCharacterUseCase.execute(character!.id!);
      if (h.isError) {
        emit(HomeScreenError(r.errorMessage!));
        return;
      }
    }
    getRandomCharacter();
  }

  void _emitContentState() {
    emit(HomeScreenContent(character!, guesses!));
  }
}
