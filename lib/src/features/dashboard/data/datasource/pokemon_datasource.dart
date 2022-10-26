import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/data/models/pokemon_model.dart';

class PokemonDatasource {
  Future<Either<Failure, List<PokemonModel>>> getPokemon() async {
    var dio = Dio();
    try {
      var response = await dio.get('https://pokeapi.co/api/v2/pokemon');
      if (response.statusCode == 200) {
        print(response.data['results']);
        final List<dynamic> body = await response.data['results'];

        return Right(body.map((model) => PokemonModel.fromMap(model)).toList());
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
