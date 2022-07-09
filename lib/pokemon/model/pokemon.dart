import 'package:flutter/material.dart';
part "evolution.dart";

class Pokemon {
  final int id;
  final String num;
  final String name;
  final List<String> type;
  final List<Evolution> nextEvolutions;
  final List<Evolution> prevEvolutions;

  const Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.type,
    required this.nextEvolutions,
    required this.prevEvolutions
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    List<Evolution> prevEvolutions = json['prev_evolution'] != null ? (json['prev_evolution'] as List<dynamic>)
        .map((resp) {
      var evolution = (resp as Map<String, dynamic>);
      return Evolution(num: evolution['num'], name: evolution['name']);
    }).toList() : [];

    List<Evolution> nextEvolutions = json['next_evolution'] != null ? (json['next_evolution'] as List<dynamic>)
        .map((resp) {
      var evolution = (resp as Map<String, dynamic>);
      return Evolution(num: evolution['num'], name: evolution['name']);
    }).toList() : [];

    return Pokemon(
      id: json['id'] as int,
      num: json['num'] as String,
      name: json['name'] as String,
      type: (json['type'] as List<dynamic>)
          .map((resp) => resp as String)
          .toList(),
      prevEvolutions: prevEvolutions,
      nextEvolutions: nextEvolutions
    );
  }

  Color? get baseColor => _color(type: type[0]);
  String get image => 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';


  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
