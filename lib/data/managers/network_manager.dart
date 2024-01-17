import 'package:dio/dio.dart';
import 'package:hogwarts_magic_hat_app/data/models/character_model.dart';
import 'package:hogwarts_magic_hat_app/data/models/network_response_model.dart';
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

  Future<NetworkResponseModel<List<CharacterModel?>>> getCharacters() async {
    try {
      var response = await dioManager.dio.get(AppConstants.characters);
      final r = response.data;

      final List<CharacterModel> l = [];
      for (final character in r) {
        l.add(CharacterModel.fromJson(character));
      }
      return NetworkResponseModel(result: l);
    } on DioException catch (e) {
      return NetworkResponseModel(
        errorMessage: e.message,
        isError: true,
      );
    }
  }
}
