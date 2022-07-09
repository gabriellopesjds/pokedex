

import 'package:pokedex/pokemon/model/pokemon.dart';

abstract class PokemonClient {
  Future<List<Pokemon>> getAllPokemons();
}