import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 310,
                  width: 220,
                  color: HexColor('#d56324ff'),
                ),
              ),
            ),
            Image.network(
              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
            ),
            Positioned(
              bottom: 85,
              left: 100,
              right: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor('#3a7233ff'),
                ),
                child: const Center(
                  child: Column(children: [
                    Text(
                      'Gekko',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Divider(
                        color: Colors.white,
                        height: 10,
                      ),
                    ),
                    Text(
                      'Initiator',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
