import 'package:bloc/bloc.dart';
import 'package:pokedex/pokemon-details/cubit/pokemon_details_appbar_state.dart';

class PokemonDetailsAppBarCubit extends Cubit<PokemonDetailsAppBarState>{

  PokemonDetailsAppBarCubit() : super(PokemonDetailsAppBarState.initial());

  void update(bool isOnTop) {
    emit(state.copyWith(status: PokemonDetailsAppBarStateEnum.update, isOnTop: isOnTop));
  }

}