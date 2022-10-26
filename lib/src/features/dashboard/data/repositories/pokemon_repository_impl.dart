import 'package:dartz/dartz.dart';
import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/data/datasource/pokemon_datasource.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemon() async {
    return await datasource.getPokemon();
  }
}
