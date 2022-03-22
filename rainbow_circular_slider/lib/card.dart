import 'package:flutter/cupertino.dart';

class CardModel {
  final String title;
  final IconData icon;
  final bool active;

  CardModel(this.title, this.icon, this.active);
}

List cards = [
  CardModel('Bedroom', CupertinoIcons.bed_double, true),
  CardModel('Kitchen', CupertinoIcons.tuningfork, false),
  CardModel('Hallway', CupertinoIcons.heart_fill, false),
];