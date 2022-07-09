import 'package:flutter/material.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_tab_about_widget.dart';
import 'package:pokedex/pokemon-details/widgets/pokemon_details_body_tab_evolutions_widget.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsBodyWidget extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetailsBodyWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailsBodyWidget> createState() =>
      _PokemonDetailsBodyWidgetState();
}

class _PokemonDetailsBodyWidgetState extends State<PokemonDetailsBodyWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            padding: const EdgeInsets.only(top: 8),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.red,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: AppConstants.texts.about),
              Tab(text: AppConstants.texts.evolution),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const PokemonDetailsBodyTabAboutWidget(),
            PokemonDetailsBodyTabEvolutionsWidget(pokemon: widget.pokemon),
          ],
        ),
      ),
    );
  }
}
