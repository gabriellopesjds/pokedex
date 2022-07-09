import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsArguments {
  final List<Pokemon> listPokemon;
  final Pokemon pokemon;
  final int? index;

  const PokemonDetailsArguments({
    this.index = 0,
    required this.pokemon,
    required this.listPokemon
  });
}