import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/models/gun.dart';

Widget gunCard(Gun gun) {
  return Center(
    child: Transform.scale(
      scale: 1.15,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                gun.displayIcon != null
                    ? Image.network(gun.displayIcon ?? '')
                    : const Placeholder(),
                Positioned(
                  bottom: 85,
                  left: 100,
                  right: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#00FFFFFF'),
                    ),
                    child: Center(
                      child: Column(children: [
                        Text(
                          gun.displayName ?? 'No Name',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Divider(
                            color: Colors.white,
                            height: 10,
                          ),
                        ),
                        Text(
                          gun.category ?? 'No Hamid',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 5,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
