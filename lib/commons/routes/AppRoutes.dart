import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/home/container/home_container.dart';
import 'package:pokedex/pokemon-details/arguments/pokemon_details_arguments.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_appbar_cubit.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_cubit.dart';
import 'package:pokedex/pokemon-details/view/pokemon_details_page.dart';

class AppRoutes extends StatelessWidget {
  const AppRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppConstants.routes.home,
      onGenerateRoute: (settions) {
        if (settions.name == AppConstants.routes.home) {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(onItemTap: (route, arguments) {
              Navigator.of(context).pushNamed(
                route,
                arguments: arguments,
              );
            });
          });
        }

        if (settions.name == AppConstants.routes.pokemonDetails) {
          return MaterialPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                  providers: [
                    BlocProvider<PokemonDetailsListCubit>(
                      create: (context) => PokemonDetailsListCubit(
                          pokemon:
                              (settions.arguments as PokemonDetailsArguments)
                                  .pokemon),
                    ),
                    BlocProvider<PokemonDetailsAppBarCubit>(
                      create: (context) => PokemonDetailsAppBarCubit(),
                    )
                  ],
                  child: PokemonDetailsPage(
                    arguments: settions.arguments as PokemonDetailsArguments,
                    voidCallback: () => Navigator.of(context).pop(),
                  ));
            },
          );
        }
      },
    );
  }
}
