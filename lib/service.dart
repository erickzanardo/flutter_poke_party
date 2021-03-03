import 'package:dio/dio.dart';
import 'package:flutter_poke_party/model.dart';

class PokemonService {
  const PokemonService();

  Future<Pokemon> findPokemon(String name) async {
    try {
      final response = await Dio()
          .get('https://pokeapi.co/api/v2/pokemon/${name.toLowerCase()}');

      final Map<String, dynamic> json = response.data;

      final String pokemonName = json['name'];
      final int number = json['id'];
      final String sprite = json['sprites']['front_default'];

      return Pokemon(
        name: pokemonName,
        number: number,
        sprite: sprite,
      );
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return null;
      }

      throw e;
    }
  }
}
