part of "pokemon.dart";

class Evolution {
  String num;
  String name;

  Evolution({
    required this.num,
    required this.name,
  });

  String get image => 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';
}