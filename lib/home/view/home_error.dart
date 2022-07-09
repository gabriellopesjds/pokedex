import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/exception/pokemon_failure_exception.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.exception}) : super(key: key);
  final exception;

  @override
  Widget build(BuildContext context) {
    String? message = (exception is PokemonFailureException) ? (exception as PokemonFailureException).message : "";
    return Scaffold(
      body: Center(
        child: Text(message ?? ""),
      ),
    );
  }
}
