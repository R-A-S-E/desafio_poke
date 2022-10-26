import 'package:pokemon_pad/src/core/failure.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/entites/pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/usecase/get_pokemon.dart';

class HomeController {
  final PokemonRepository repository;
  final GetPokemonUseCase getPokemons;

  HomeController(this.repository, this.getPokemons);

  final List<Pokemon> pokemonList = [];

  bool isLoading = false;

  void getPokemon() async {
    isLoading = true;
    var result = await getPokemons.getPokemon();

    return result.fold(
      (l) {
        isLoading = false;
        Failure(message: l.message, statusCode: l.statusCode);
      },
      (r) {
        isLoading = false;
        pokemonList.addAll(r);
      },
    );
  }
}
