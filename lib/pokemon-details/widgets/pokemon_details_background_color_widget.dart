import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_cubit.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_state.dart';

class PokemonDetailsBackgroundColorWidget extends StatefulWidget {
  const PokemonDetailsBackgroundColorWidget({Key? key}) : super(key: key);

  @override
  State<PokemonDetailsBackgroundColorWidget> createState() => _PokemonDetailsBackgroundColorWidgetState();
}

class _PokemonDetailsBackgroundColorWidgetState extends State<PokemonDetailsBackgroundColorWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsListCubit,
        PokemonDetailsListState, Color?>(
        selector: (value) => value.pokemon.baseColor,
        builder: (context, color) {
          return Container(
            color: color,
          );
        });
  }
}
