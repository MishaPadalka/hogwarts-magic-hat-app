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
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/get_random_character_use_case.dart'
    as _i7;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/is_box_empty_use_case.dart'
    as _i9;
import 'package:hogwarts_magic_hat_app/domain/use_cases/local/save_characters_use_case.dart'
    as _i10;
import 'package:hogwarts_magic_hat_app/domain/use_cases/network/get_characters_use_case.dart'
    as _i6;
import 'package:hogwarts_magic_hat_app/presentation/screens/home_screen/home_screen_cubit/home_screen_cubit.dart'
    as _i8;
import 'package:hogwarts_magic_hat_app/presentation/screens/splash_screen/splash_screen_cubit/splash_screen_cubit.dart'
    as _i11;
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
  gh.lazySingleton<_i6.GetCharactersUseCase>(
      () => _i6.GetCharactersUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i7.GetRandomCharacterUseCase>(
      () => _i7.GetRandomCharacterUseCase(gh<_i5.CharactersRepository>()));
  gh.factory<_i8.HomeScreenCubit>(
      () => _i8.HomeScreenCubit(gh<_i7.GetRandomCharacterUseCase>()));
  gh.lazySingleton<_i9.IsBoxEmptyUseCase>(
      () => _i9.IsBoxEmptyUseCase(gh<_i5.CharactersRepository>()));
  gh.lazySingleton<_i10.SaveCharactersUseCase>(
      () => _i10.SaveCharactersUseCase(gh<_i5.CharactersRepository>()));
  gh.factory<_i11.SplashScreenCubit>(() => _i11.SplashScreenCubit(
        gh<_i6.GetCharactersUseCase>(),
        gh<_i10.SaveCharactersUseCase>(),
        gh<_i9.IsBoxEmptyUseCase>(),
      ));
  return getIt;
}
