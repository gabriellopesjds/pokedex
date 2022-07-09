import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_appbar_cubit.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_appbar_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_background_color_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_decoration_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_list_widget.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsArguments arguments;
  final VoidCallback voidCallback;

  const PokemonDetailsPage(
      {Key? key, required this.arguments, required this.voidCallback})
      : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late ScrollController _scrollViewController;
  bool isOnTop = false;

  @override
  void initState() {
    _scrollViewController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PokemonDetailsAppBarCubit>();
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          isOnTop = isOnTopPositionScrollController();
          bloc.update(isOnTop);
          return true;
        },
        child: CustomScrollView(
          controller: _scrollViewController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            PokemonDetailsAppBarWidget(
              pokemon: widget.arguments.pokemon,
              onBack: widget.voidCallback,
              isOnTop: isOnTop,
            ),
            PokemonDetailsListWidget(
              arguments: widget.arguments,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    20,
                child: Stack(
                  children: [
                    const PokemonDetailsBackgroundColorWidget(),
                    const PokemonDetailsBodyDecorationWidget(),
                    PokemonDetailsBodyWidget(pokemon: widget.arguments.pokemon)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOnTopPositionScrollController() {
    if (_scrollViewController.position.pixels > AppBar().preferredSize.height) {
      return false;
    }
    return true;
  }
}
