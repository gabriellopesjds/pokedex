import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_appbar_cubit.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_appbar_state.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_state.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

import '../cubit/pokemon_details_list_cubit.dart';

class PokemonDetailsAppBarWidget extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  const PokemonDetailsAppBarWidget(
      {Key? key,
      required this.pokemon,
      required this.onBack,
      required this.isOnTop})
      : super(key: key);

  @override
  State<PokemonDetailsAppBarWidget> createState() =>
      _PokemonDetailsAppBarWidgetState();
}

class _PokemonDetailsAppBarWidgetState
    extends State<PokemonDetailsAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsListCubit, PokemonDetailsListState,
            Pokemon>(
        selector: (value) => value.pokemon,
        builder: (context, pokemon) {
          return SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: pokemon.baseColor,
            leading: IconButton(
              onPressed: widget.onBack,
              icon: const Icon(Icons.chevron_left),
            ),
            centerTitle: false,
            title: BlocSelector<PokemonDetailsAppBarCubit,
                PokemonDetailsAppBarState, bool>(
              selector: (state) => state.isOnTop,
              builder: (context, isOnTop) {
                return Opacity(
                  opacity: isOnTop ? 0 : 1,
                  child: Text(widget.pokemon.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                );
              },
            ),
          );
        });
  }
}
