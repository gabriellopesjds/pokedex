import 'package:flutter/material.dart';
import 'package:pokedex/commons/const/app_constants.dart';

class PokemonDetailsBodyTabAboutWidget extends StatelessWidget {
  const PokemonDetailsBodyTabAboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.texts.description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              AppConstants.texts.contentDescriptionMock,
              style: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
