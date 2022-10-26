import 'package:flutter/material.dart';
import 'package:pokemon_pad/src/features/select_pokemon/data/datasource/select_pokemon_datasource.dart';
import 'package:pokemon_pad/src/features/select_pokemon/data/models/select_pokemon_models.dart';

class SelectPokemonController {
  SelectPokemonModel? pokemon;
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void getSelectPokemon(String url) async {
    isLoading.value = true;
    var response = await SelectPokemonDatasource().getPokemon(url);
    isLoading.value = false;

    response.fold((l) => null, (r) => pokemon = r);
  }
}
