import 'package:flutter/material.dart';
import 'package:pokemon_pad/src/features/select_pokemon/view/pages/select_pokemon/controller/select_pokemon_controller.dart';

class SelectPokemonPage extends StatefulWidget {
  final String url;
  const SelectPokemonPage({super.key, required this.url});

  @override
  State<SelectPokemonPage> createState() => _SelectPokemonPageState();
}

class _SelectPokemonPageState extends State<SelectPokemonPage> {
  var controller = SelectPokemonController();
  @override
  void initState() {
    controller.getSelectPokemon(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pokemon?.name ?? ''),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.isLoading,
        builder: (_, isLoading, ___) {
          return !isLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      controller.pokemon!.image,
                      height: 300,
                      width: 200,
                    ),
                    Text('Peso ${controller.pokemon!.weight}'),
                    Text('Altura ${controller.pokemon!.height}'),
                    Text('Nome ${controller.pokemon!.name}'),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
