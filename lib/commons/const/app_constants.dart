class AppConstants {
  static AppContantsTexts get texts => AppContantsTexts();
  static AppContantsRoutes get routes => AppContantsRoutes();
  static AppConstantsClient get clients => AppConstantsClient();
  static AppConstantsException get exceptions => AppConstantsException();
}

class AppContantsTexts {
  String get title => "Pokedex";
  String get about => "About";
  String get evolution => "Evolution";
  String get status => "Status";
  String get description => "Description";
  String get contentDescriptionMock => "In 1998, Nintendo spent 25 million promoting Pokémon in the United States in partnership with Hasbro, KFC, and others.[14] Nintendo initially feared that Pokémon was too Japanese for Western tastes but Alfred Kahn, then CEO of 4Kids Entertainment convinced the company otherwise. The one who spotted Pokemon's potential in the United States was Kahn's colleague Thomas Kenney.";
  String get nextEvolutions => "Next Evolutions";
  String get prevEvolutions => "Prev Evolutions";
  String get notEvolutions => "There are no evolutions :(";
}

class AppContantsRoutes {
  String get home => "/";
  String get pokemonDetails => "/pokemon-details";
}

class AppConstantsClient {
  String get clientGetAllPokemonsURL => 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
}

class AppConstantsException {
  String get error_loading_pokemons => "Não foi possível carregar a lista de pokemon";
}