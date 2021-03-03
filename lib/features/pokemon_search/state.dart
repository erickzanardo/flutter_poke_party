import 'package:flutter_poke_party/model.dart';

abstract class PokeSearchState {
  final Pokemon selectedPokemon;

  const PokeSearchState({this.selectedPokemon});
}

class PokeSearchStateInitial extends PokeSearchState {
  const PokeSearchStateInitial();
}

class PokeSearchStateNotFound extends PokeSearchState {
  const PokeSearchStateNotFound();
}

class PokeSearchStateError extends PokeSearchState {
  const PokeSearchStateError();
}

class PokeSearchStateSearchLoading extends PokeSearchState {
  const PokeSearchStateSearchLoading();
}

class PokeSearchStateSearchLoaded extends PokeSearchState {
  const PokeSearchStateSearchLoaded(Pokemon foundPokemon)
      : super(selectedPokemon: foundPokemon);
}
