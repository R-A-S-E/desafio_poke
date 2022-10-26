import 'package:dartz/dartz.dart';
import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository _repository;

  GetPokemon(this._repository);

  Future<Either<Failure, List<Pokemon>>> buscarFaq() async {
    return await _repository.getPokemon();
  }
}
