import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/pokemon/client/pokemon_client.dart';
import 'package:pokedex/pokemon/exception/pokemon_failure_exception.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonClientImpl implements PokemonClient {
  final Dio dio;

  PokemonClientImpl() : this.dio = Dio();

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response =
          await dio.get(AppConstants.clients.clientGetAllPokemonsURL);
      final responseJson = jsonDecode(response.data) as Map<String, dynamic>;
      final responseList = responseJson["pokemon"] as List<dynamic>;

      return responseList
          .map<Pokemon>((resp) => Pokemon.fromMap(resp))
          .toList();

    } catch (ex) {
      throw PokemonFailureException(
          message: AppConstants.exceptions.error_loading_pokemons);
    }
  }
}
