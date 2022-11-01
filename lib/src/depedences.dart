import 'package:get_it/get_it.dart';
import 'package:pokemon_pad/src/features/dashboard/data/datasource/pokemon_datasource.dart';
import 'package:pokemon_pad/src/features/dashboard/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_pad/src/features/dashboard/domain/usecase/get_pokemon.dart';
import 'package:pokemon_pad/src/features/dashboard/view/pages/home/controller/home_controller.dart';

GetIt di = GetIt.I;

void registerDependencies() {
  //
  di.registerLazySingleton<PokemonDatasource>(() => PokemonDatasource());
  di.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(di.get()));
  di.registerLazySingleton<GetPokemonUseCase>(
      () => GetPokemonUseCase(di.get()));
//asdasdasd
  di.registerLazySingleton<HomeController>(
      () => HomeController(di.get(), di.get()));
}
