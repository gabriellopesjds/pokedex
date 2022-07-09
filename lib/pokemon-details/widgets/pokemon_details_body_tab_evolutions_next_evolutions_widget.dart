import 'package:flutter/material.dart';

class PokemonDetailsBodyTabEvolutionsNextEvolutionsWidget extends StatelessWidget {
  final String pokemonImage;
  final String pokemonNextImage;

  const PokemonDetailsBodyTabEvolutionsNextEvolutionsWidget({Key? key, required this.pokemonImage, required this.pokemonNextImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(children: [
            Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pokeball_dark.png',
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network(pokemonImage),
            ),
          ]),
          const Icon(Icons.arrow_forward_ios),
          Stack(children: [
            Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pokeball_dark.png',
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Image.network(pokemonNextImage),
            ),
          ]),
        ],
      ),
    );
  }
}
