import 'package:flutter/material.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/home/widgets/pokemon_item_widget.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> listPokemon;
  final Function(String, PokemonDetailsArguments) onItemTap;

  const HomePage({Key? key, required this.listPokemon, required this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            AppConstants.texts.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: listPokemon
                .map((element) => PokemonItemWidget(
                      pokemon: element,
                      onTap: onItemTap,
                      index: listPokemon.indexOf(element),
                      listPokemon: listPokemon,
                    ))
                .toList()),
      ),
    );
  }
}
