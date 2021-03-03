import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_party/features/pokemon_party/controller.dart';
import 'package:flutter_poke_party/features/pokemon_party/state.dart';
import 'package:flutter_poke_party/features/pokemon_party/widget.dart';
import 'package:flutter_poke_party/features/pokemon_search/controller.dart';
import 'package:flutter_poke_party/features/pokemon_search/state.dart';

class PokemonParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSearchController, PokeSearchState>(
        builder: (_, searchState) {
          return BlocBuilder<PokemonPartyController, PokePartyState>(
              builder: (ctx, state) {
                return PokemonPartyView(
                    party: state.party,
                    onAddPokemon: (int position) {
                      context.read<PokemonPartyController>().setPokemonOnParty(searchState.selectedPokemon, position);
                    },
                    onRemovePokemon: (int position) {
                      context.read<PokemonPartyController>().removePokemonFromParty(position);
                    }
                );
              },
          );
        },
    );
  }
}
