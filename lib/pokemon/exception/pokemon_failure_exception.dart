class PokemonFailureException implements Exception {
  final String? message;

  const PokemonFailureException({
    this.message,
  });
}