import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsListState {
  final PokemonDetailsListStateEnum status;
  final Pokemon pokemon;

  PokemonDetailsListState._({required this.status, required this.pokemon});

  PokemonDetailsListState.initial(Pokemon pokemon) : this._(status: PokemonDetailsListStateEnum.initial, pokemon: pokemon);

  PokemonDetailsListState copyWith({
    PokemonDetailsListStateEnum? status,
    Pokemon? pokemon,
    double? turn,
  }) {
    return PokemonDetailsListState._(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon
    );
  }
}

enum PokemonDetailsListStateEnum {
  initial, update
}
