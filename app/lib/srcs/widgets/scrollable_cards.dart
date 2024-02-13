import 'package:flutter/material.dart';

Widget scrollableCards<T>(List<T> items, Widget Function(T) buildCard) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListWheelScrollView(
      itemExtent: 500,
      diameterRatio: 5,
      children: items.map((item) => buildCard(item)).toList(),
    ),
  );
}
