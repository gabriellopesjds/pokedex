import 'package:bloc/bloc.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_list_state.dart';
import 'package:pokedex/pokemon/model/pokemon.dart';

class PokemonDetailsListCubit extends Cubit<PokemonDetailsListState>{

  PokemonDetailsListCubit({required Pokemon pokemon}) : super(PokemonDetailsListState.initial(pokemon));

  void update(Pokemon pokemon) {
    emit(state.copyWith(status: PokemonDetailsListStateEnum.update, pokemon: pokemon));
  }

}