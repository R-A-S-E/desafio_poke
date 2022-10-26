import 'package:flutter/cupertino.dart';
import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/usecase/get_pokemon.dart';

class HomeController {
  final PokemonRepository repository;
  final GetPokemonUseCase getPokemons;

  HomeController(this.repository, this.getPokemons);

  final List<Pokemon> pokemonList = [];

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void getPokemon() async {
    isLoading.value = true;
    var result = await getPokemons.getPokemon();
    isLoading.value = false;
    return result.fold(
      (l) {
        Failure(message: l.message, statusCode: l.statusCode);
      },
      (r) {
        pokemonList.addAll(r);
      },
    );
  }
}
