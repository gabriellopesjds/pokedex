import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_cubit.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_state.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_tab_evolutions_next_evolutions_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_tab_evolutions_prev_evolutions_widget.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsBodyTabEvolutionsWidget extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsBodyTabEvolutionsWidget({Key? key, required this.pokemon})
      : super(key: key);

  @override
  State<PokemonDetailsBodyTabEvolutionsWidget> createState() =>
      _PokemonDetailsBodyTabEvolutionsWidgetState();
}

class _PokemonDetailsBodyTabEvolutionsWidgetState
    extends State<PokemonDetailsBodyTabEvolutionsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsListCubit, PokemonDetailsListState,
        Pokemon>(
      selector: (value) => value.pokemon,
      builder: (context, element) {
        var nextEvolutions = element.nextEvolutions.map((e) {
          return PokemonDetailsBodyTabEvolutionsNextEvolutionsWidget(
              pokemonImage: element.image, pokemonNextImage: e.image);
        }).toList();

        var prevEvolutions = element.prevEvolutions.map((e) {
          return PokemonDetailsBodyTabEvolutionsPrevEvolutionsWidget(
              pokemonImage: element.image, pokemonPrevImage: e.image);
        }).toList();

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                AppConstants.texts.nextEvolutions,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Column(
              children: nextEvolutions.isNotEmpty
                  ? nextEvolutions
                  : [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          AppConstants.texts.notEvolutions,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                AppConstants.texts.prevEvolutions,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Column(
              children: prevEvolutions.isNotEmpty
                  ? prevEvolutions
                  : [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          AppConstants.texts.notEvolutions,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
            )
          ],
        );
      },
    );
  }
}
