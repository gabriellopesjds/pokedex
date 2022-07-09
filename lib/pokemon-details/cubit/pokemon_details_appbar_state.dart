

class PokemonDetailsAppBarState {
  final PokemonDetailsAppBarStateEnum status;
  final bool isOnTop;

  PokemonDetailsAppBarState._({required this.status, required this.isOnTop});

  PokemonDetailsAppBarState.initial() : this._(status: PokemonDetailsAppBarStateEnum.initial, isOnTop: false);

  PokemonDetailsAppBarState copyWith({
    PokemonDetailsAppBarStateEnum? status,
    bool? isOnTop,
  }) {
    return PokemonDetailsAppBarState._(
      status: status ?? this.status,
      isOnTop: isOnTop ?? this.isOnTop,
    );
  }
}

enum PokemonDetailsAppBarStateEnum {
  initial, update
}
