import 'package:dio/dio.dart';
import 'package:hogwarts_magic_hat_app/data/mapper/remote_character_mapper.dart';
import 'package:hogwarts_magic_hat_app/data/models/local_models/character_local_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/remote_models/response_model.dart';
import 'package:hogwarts_magic_hat_app/presentation/shared/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
}

@singleton
class NetworkManagerImpl {
  final DioManager dioManager;

  NetworkManagerImpl(this.dioManager);

  Future<ResponseModel<List<CharacterLocalModel>>> getCharacters() async {
    try {
      var response = await dioManager.dio.get(AppConstants.characters);
      final r = response.data;

      final List<CharacterModel> l = [];
      for (final character in r) {
        l.add(CharacterModel.fromJson(character));
      }
      return ResponseModel(result: mapListCharacterModelToListCharacterLocalModel(l));
    } on DioException catch (e) {
      return ResponseModel(
        errorMessage: e.message,
        isError: true,
      );
    }
  }
}
