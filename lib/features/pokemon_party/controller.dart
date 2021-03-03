import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_party/features/pokemon_party/state.dart';
import 'package:flutter_poke_party/model.dart';

class PokemonPartyController extends Cubit<PokePartyState>{
  PokemonPartyController(): super(PokePartyState());

  void setPokemonOnParty(Pokemon pokemon, int position) {
    assert(position >= 0 && position <= 5);
    final party = [...state.party];
    party[position] = pokemon;
    emit(PokePartyState(party: party));
  }

  void removePokemonFromParty(int position) {
    setPokemonOnParty(null, position);
  }
}
