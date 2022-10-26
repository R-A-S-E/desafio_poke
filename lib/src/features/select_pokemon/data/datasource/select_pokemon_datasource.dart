import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/select_pokemon/data/models/select_pokemon_models.dart';

class SelectPokemonDatasource {
  Future<Either<Failure, SelectPokemonModel>> getPokemon(String url) async {
    var dio = Dio();
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        final dynamic data = await response.data;
        return Right(SelectPokemonModel.fromMap(data));
      } else {
        return Left(
          Failure(
            message: response.data['message'],
          ),
        );
      }
    } on DioError catch (e) {
      return Left(Failure(
        message: e.response?.data['statusMessage'],
      ));
    }
  }
}
