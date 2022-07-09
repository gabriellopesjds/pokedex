import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_cubit.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_state.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_list_item_widget.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsListWidget extends StatefulWidget {
  final PokemonDetailsArguments arguments;

  const PokemonDetailsListWidget({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<PokemonDetailsListWidget> createState() =>
      _PokemonDetailsListWidgetState();
}

class _PokemonDetailsListWidgetState extends State<PokemonDetailsListWidget> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.6, initialPage: widget.arguments.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PokemonDetailsListCubit>();
    return SliverToBoxAdapter(
      child: BlocSelector<PokemonDetailsListCubit, PokemonDetailsListState,
              Pokemon>(
          selector: (value) => value.pokemon,
          builder: (context, pokemon) {
            return Container(
              color: pokemon.baseColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text("#${pokemon.num}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      onPageChanged: (index) =>
                          bloc.update(widget.arguments.listPokemon[index]),
                      controller: _controller,
                      children: widget.arguments.listPokemon.map((element) {
                        var isPokemonDiff = element != pokemon;
                        return PokemonDetailsListItemWidget(
                            isPokemonDiff: isPokemonDiff, pokemon: element);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
