import 'package:flutter/material.dart';
import 'package:flutter_poke_party/model.dart';

class PokemonPartyView extends StatelessWidget {
  final List<Pokemon> party;
  final Function(int) onRemovePokemon;
  final Function(int) onAddPokemon;

  PokemonPartyView({
    @required this.party,
    @required this.onRemovePokemon,
    @required this.onAddPokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < party.length; i++)
                Container(
                    child: party[i] == null ?
                      ElevatedButton(
                          child: Text('+'),
                          onPressed: () {
                            onAddPokemon(i);
                          }
                      ) : Image.network(
                        party[i].sprite,
                        height: 80,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                ),
            ],
        ),
    );
  }
}
