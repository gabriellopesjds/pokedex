import 'package:flutter/material.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/home/widgets/pokemon_type_widget.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final Function(String, PokemonDetailsArguments) onTap;
  final int index;

  const PokemonItemWidget(
      {Key? key,
      required this.pokemon,
      required this.onTap,
      required this.index,
      required this.listPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        AppConstants.routes.pokemonDetails,
        PokemonDetailsArguments(
          pokemon: pokemon,
          index: index,
          listPokemon: listPokemon,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "#${pokemon.num}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((pokemonName) =>
                                PokemonTypeWidget(name: pokemonName))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 100,
                width: 100,
              ),
            ),
          ),
          Positioned(
              bottom: 8,
              right: 8,
              child: Image.network(
                pokemon.image,
                height: 80,
              ))
        ],
      ),
    );
  }
}
