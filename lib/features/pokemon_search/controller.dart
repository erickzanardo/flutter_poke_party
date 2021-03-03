import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_party/service.dart';

import './state.dart';

class PokemonSearchController extends Cubit<PokeSearchState> {
  final PokemonService service;

  PokemonSearchController({
    this.service = const PokemonService(),
  }) : super(PokeSearchStateInitial());

  Future<void> searchPokemon(String name) async {
    emit(PokeSearchStateSearchLoading());
    try {
      final pokemon = await service.findPokemon(name);
      if (pokemon != null) {
        emit(PokeSearchStateSearchLoaded(pokemon));
      } else {
        emit(PokeSearchStateNotFound());
      }
    } catch (err) {
      emit(PokeSearchStateError());
    }
  }
}
