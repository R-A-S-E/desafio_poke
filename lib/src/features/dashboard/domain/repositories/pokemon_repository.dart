import 'package:dartz/dartz.dart';
import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemon();
}
