import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_party/features/pokemon_party/container.dart';
import 'package:flutter_poke_party/features/pokemon_party/controller.dart';
import 'package:flutter_poke_party/features/pokemon_search/container.dart';
import 'package:flutter_poke_party/features/pokemon_search/controller.dart';

void main() {
  runApp(PokeParty());
}

class PokeParty extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke Party',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<PokemonSearchController>(
              create: (_) => PokemonSearchController(),
            ),
            BlocProvider<PokemonPartyController>(
              create: (_) => PokemonPartyController(),
            ),
          ],
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PokemonSearch(),
                PokemonParty(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
