import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/data/models/pokemon_model.dart';

class PokemonDatasource {
  Future<Either<Failure, List<PokemonModel>>> getFaq() async {
    var dio = Dio();
    try {
      var response = await dio.get('/faqs/login');
      if (response.statusCode == 200) {
        final List<dynamic> body = await response.data['data'];

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
