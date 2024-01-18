// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hogwarts_magic_hat_app/data/managers/local_manager.dart' as _i4;
import 'package:hogwarts_magic_hat_app/data/managers/network_manager.dart'
    as _i3;
import 'package:hogwarts_magic_hat_app/data/repositories/characters_repository.dart'
    as _i5;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/delete_character_use_case.dart'
    as _i6;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/edit_chosen_character_use_case.dart'
    as _i7;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_chosen_character_use_case.dart'
    as _i9;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_random_character_use_case.dart'
    as _i10;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_total_guesses_use_case.dart'
    as _i11;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/is_box_contains_character.dart'
    as _i12;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/is_box_empty_use_case.dart'
    as _i13;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_characters_use_case.dart'
    as _i14;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_chosen_character_use_case.dart'
    as _i15;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_total_guesses_use_case.dart'
    as _i16;
import 'package:hogwarts_magic_hat_app/domain/use_cases/network/get_characters_use_case.dart'
    as _i8;
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen_cubit/home_screen_cubit.dart'
    as _i18;
import 'package:hogwarts_magic_hat_app/presentation/screens/splash_screen/splash_screen_cubit/splash_screen_cubit.dart'
    as _i17;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.DioManager>(_i3.DioManager());
  gh.singleton<_i4.LocalManagerImpl>(_i4.LocalManagerImpl());
  gh.singleton<_i3.NetworkManagerImpl>(
      _i3.NetworkManagerImpl(gh<_i3.DioManager>()));
  gh.singleton<_i5.CharactersRepository>(_i5.CharactersRepository(
    gh<_i3.NetworkManagerImpl>(),
    gh<_i4.LocalManagerImpl>(),
  ));
  gh.lazySingleton<_i6.DeleteCharacterUseCase>(
      () => _i6.DeleteCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i7.EditChosenCharacterUseCase>(
      () => _i7.EditChosenCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i8.GetCharactersUseCase>(
      () => _i8.GetCharactersUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i9.GetChosenCharacterUseCase>(
      () => _i9.GetChosenCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i10.GetRandomCharacterUseCase>(
      () => _i10.GetRandomCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i11.GetTotalGuessesUseCase>(
      () => _i11.GetTotalGuessesUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i12.IsBoxContainsCharacter>(
      () => _i12.IsBoxContainsCharacter(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i13.IsBoxEmptyUseCase>(
      () => _i13.IsBoxEmptyUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i14.SaveCharactersUseCase>(
      () => _i14.SaveCharactersUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i15.SaveChosenCharacterUseCase>(
      () => _i15.SaveChosenCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i16.SaveTotalGuessesUseCase>(
      () => _i16.SaveTotalGuessesUseCase(gh<_i5.CharactersRepository>()));
  gh.factory<_i17.SplashScreenCubit>(() => _i17.SplashScreenCubit(
        gh<_i8.GetCharactersUseCase>(),
        gh<_i14.SaveCharactersUseCase>(),
        gh<_i13.IsBoxEmptyUseCase>(),
      ));
  gh.factory<_i18.HomeScreenCubit>(() => _i18.HomeScreenCubit(
        gh<_i10.GetRandomCharacterUseCase>(),
        gh<_i12.IsBoxContainsCharacter>(),
        gh<_i9.GetChosenCharacterUseCase>(),
        gh<_i7.EditChosenCharacterUseCase>(),
        gh<_i15.SaveChosenCharacterUseCase>(),
        gh<_i11.GetTotalGuessesUseCase>(),
        gh<_i16.SaveTotalGuessesUseCase>(),
        gh<_i6.DeleteCharacterUseCase>(),
      ));
  return getIt;
}
