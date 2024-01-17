import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/is_box_empty_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_characters_use_case.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/network/get_characters_use_case.dart';
import 'package:injectable/injectable.dart';

part 'splash_screen_state.dart';

@injectable
class SplashScreenCubit extends Cubit<SplashScreenState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final SaveCharactersUseCase _saveCharactersUseCase;
  final IsBoxEmptyUseCase _isBoxEmptyUseCase;

  List<CharacterLocalModel> characters = [];

  SplashScreenCubit(
      this._getCharactersUseCase, this._saveCharactersUseCase, this._isBoxEmptyUseCase)
      : super(SplashScreenInitial()) {
    isBoxEmpty();
  }

  Future<void> getCharacters() async {
    final ResponseModel<List<CharacterLocalModel>> r = await _getCharactersUseCase.execute();
    if (r.isError || r.result == null) {
      emit(
        SplashScreenError(
          r.errorMessage ?? 'Something went wrong',
        ),
      );
      return;
    }
    characters = r.result!;
    await saveCharacters();
    emit(SplashScreenRedirectToHomeScreen());
  }

  Future<void> saveCharacters() async {
    final ResponseModel<void> r = await _saveCharactersUseCase.execute(characters);
    if (r.isError) {
      emit(
        SplashScreenError(
          r.errorMessage ?? 'Something went wrong',
        ),
      );
    }
    emit(SplashScreenEvent());
    Future.delayed(const Duration(seconds: 2))
        .then((value) => emit(SplashScreenRedirectToHomeScreen()));
  }

  Future<void> isBoxEmpty() async {
    emit(SplashScreenLoading());
    final bool r = await _isBoxEmptyUseCase.execute();
    if (r) {
      getCharacters();
    } else {
      Future.delayed(const Duration(seconds: 2))
          .then((value) => emit(SplashScreenRedirectToHomeScreen()));
    }
  }
}
