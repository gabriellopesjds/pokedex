import 'package:flutter/material.dart';

class PokemonDetailsBodyDecorationWidget extends StatelessWidget {
  const PokemonDetailsBodyDecorationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
    );
  }
}
