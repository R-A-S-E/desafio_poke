import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_pad/src/features/dashboard/view/pages/home/controller/home_controller.dart';
import 'package:pokemon_pad/src/features/select_pokemon/view/pages/select_pokemon/select_pokemon_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = GetIt.I<HomeController>();
  @override
  void initState() {
    controller.getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pokemons'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: controller.isLoading,
          builder: (_, isLoading, ___) {
            return SizedBox(
                child: !isLoading
                    ? ListView(
                        children: controller.pokemonList
                            .map(
                              (e) => ListTile(
                                title: Text(e.name),
                                //coisa feia só para colocar o ID fiz 2 replace
                                trailing: Text(e.url
                                    .replaceFirst(
                                        'https://pokeapi.co/api/v2/pokemon/',
                                        '')
                                    .replaceAll('/', '')),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SelectPokemonPage(url: e.url),
                                    )),
                              ),
                            )
                            .toList(),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ));
          }),
    );
  }
}
