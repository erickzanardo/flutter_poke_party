import 'package:meta/meta.dart';

class Pokemon {
  final String name;
  final String sprite;
  final int number;

  Pokemon({
    @required this.name,
    @required this.sprite,
    @required this.number,
  }) : assert(name != null && sprite != null && number != null);
}
