import 'package:flutter/material.dart';
import 'package:flutter_poke_party/model.dart';

class PokemonSearchView extends StatefulWidget {
  final bool isLoading;
  final bool notFound;
  final bool hasError;
  final Pokemon foundPokemon;
  final Function(String) onSearch;

  PokemonSearchView({
    @required this.onSearch,
    this.isLoading = false,
    this.notFound = false,
    this.hasError = false,
    this.foundPokemon,
  }) : assert(onSearch != null);

  @override
  State<StatefulWidget> createState() => _PokemonSearchViewState();
}

class _PokemonSearchViewState extends State<PokemonSearchView> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) return Container(height: 500, child: Text('Loading'));

    return Container(
      height: 500,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.isLoading)
            Container(
                height: 350,
                child: Text('Loading...'),
            ),
          if (widget.notFound) Text('Not found'),
          if (widget.hasError)
            Text('Something went wrong, please try again in a few minutes...'),
          if (!widget.hasError &&
              !widget.notFound &&
              widget.foundPokemon == null)
            Text('No Pokémon selected yet'),
          if (widget.isLoading)
            Container(
                height: 350,
                child: Text('Loading...'),
            ),
          if (widget.foundPokemon != null) ...[
            Image.network(
              widget.foundPokemon.sprite,
              height: 350,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
            Text(widget.foundPokemon.name),
          ],
          TextField(controller: _controller, textAlign: TextAlign.center,),
          ElevatedButton(
            child: Text('Search'),
            onPressed: () {
              widget.onSearch(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}
