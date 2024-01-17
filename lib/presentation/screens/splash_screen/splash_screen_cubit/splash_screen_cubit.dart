import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_magic_hat_app/data/models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/network_response_model.dart';
import 'package:hogwarts_magic_hat_app/domain/use_cases/network/get_characters_use_case.dart';
import 'package:injectable/injectable.dart';

part 'splash_screen_state.dart';

@injectable
class SplashScreenCubit extends Cubit<SplashScreenState> {
  final GetCharactersUseCase _getCharactersUseCase;

  SplashScreenCubit(this._getCharactersUseCase) : super(SplashScreenInitial()) {
    getCharacters();
  }

  Future<void> getCharacters() async {
    emit(SplashScreenLoading());
    final NetworkResponseModel<List<CharacterModel?>> r = await _getCharactersUseCase.execute();
    if (r.isError || r.result == null) {
      emit(
        SplashScreenError(
          r.errorMessage ?? 'Something went wrong',
        ),
      );
      return;
    }
    emit(SplashScreenLoaded());
  }
}
