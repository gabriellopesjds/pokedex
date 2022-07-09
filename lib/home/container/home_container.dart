import 'package:flutter/material.dart';
import 'package:pokedex/home/view/home_error.dart';
import 'package:pokedex/home/view/home_loading.dart';
import 'package:pokedex/home/view/home_page.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon/client/impl/pokemon_client_impl.dart';
import 'package:pokedex/pokemon/client/pokemon_client.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class HomeContainer extends StatelessWidget {
  final PokemonClient pokemonRepository;
  final Function(String, PokemonDetailsArguments) onItemTap;

  HomeContainer({Key? key, required this.onItemTap})
      : this.pokemonRepository = PokemonClientImpl(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: pokemonRepository.getAllPokemons(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const HomeLoading();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return HomePage(
                  listPokemon: snapshot.data!,
                  onItemTap: onItemTap,
                );
              }
              if (snapshot.hasError) {
                return HomeError(exception: snapshot.error);
              }
              return Container();
          }
        });
  }
}
