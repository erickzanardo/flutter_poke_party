import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_party/features/pokemon_search/controller.dart';
import 'package:flutter_poke_party/features/pokemon_search/state.dart';
import 'package:flutter_poke_party/features/pokemon_search/widget.dart';

class PokemonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSearchController, PokeSearchState>(
      builder: (ctx, state) {
        final isLoading = state is PokeSearchStateSearchLoading;
        final notFound = state is PokeSearchStateNotFound;
        final hasError = state is PokeSearchStateError;
        final selectedPokemon =
            state is PokeSearchStateSearchLoaded ? state.selectedPokemon : null;

        return PokemonSearchView(
          isLoading: isLoading,
          notFound: notFound,
          hasError: hasError,
          foundPokemon: selectedPokemon,
          onSearch: (name) {
            ctx.read<PokemonSearchController>().searchPokemon(name);
          },
        );
      },
    );
  }
}
