import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// Widget scrollableCards<T>(List<T> items, Widget Function(T) buildCard) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ListWheelScrollView(
//       itemExtent: 500,
//       diameterRatio: 5,
//       children: items.map((item) => buildCard(item)).toList(),
//     ),
//   );
// }

Widget scrollableCards<T>(List<T> items, Widget Function(T) buildCard) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return buildCard(items[index]);
        },
        options: CarouselOptions(
          height: 500,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ));
}
