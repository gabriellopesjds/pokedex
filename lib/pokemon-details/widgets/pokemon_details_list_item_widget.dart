import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsListItemWidget extends StatefulWidget {
  final bool isPokemonDiff;
  final Pokemon pokemon;

  const PokemonDetailsListItemWidget(
      {Key? key, required this.isPokemonDiff, required this.pokemon})
      : super(key: key);

  @override
  State<PokemonDetailsListItemWidget> createState() =>
      _PokemonDetailsListItemWidgetState();
}

class _PokemonDetailsListItemWidgetState
    extends State<PokemonDetailsListItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Stack(
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: Opacity(
                opacity: widget.isPokemonDiff ? 0.0 : 0.3,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            AnimatedOpacity(
                duration: const Duration(milliseconds: 900),
                opacity: widget.isPokemonDiff ? 0.5 : 1.0,
                child: Image.network(
                  widget.pokemon.image,
                  color: widget.isPokemonDiff
                      ? Colors.black.withOpacity(0.4)
                      : null,
                  fit: BoxFit.contain,
                ))
          ],
        ),
      ),
    );
  }
}
