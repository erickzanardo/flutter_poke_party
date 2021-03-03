import 'package:flutter_poke_party/model.dart';

class PokePartyState {
  final List<Pokemon> party;

  PokePartyState({
    this.party = const [null, null, null, null, null, null],
  }): assert(party.length == 6);
}

