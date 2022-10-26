import 'package:dartz/dartz.dart';
import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';

class GetPokemonUseCase {
  final PokemonRepository _repository;

  GetPokemonUseCase(this._repository);

  Future<Either<Failure, List<Pokemon>>> getPokemon() async {
    return await _repository.getPokemon();
  }
}
