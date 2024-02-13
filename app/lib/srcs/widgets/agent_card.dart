import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/models/agent.dart';

Widget agentCard(Agent agent) {
  return Center(
    child: Transform.scale(
      scale: 1.15,
      child: Card(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HexColor(
                            agent.backgroundGradientColors?[0] ?? '#808080'),
                        HexColor(
                            agent.backgroundGradientColors?[1] ?? '#808080'),
                        HexColor(
                            agent.backgroundGradientColors?[2] ?? '#808080'),
                        HexColor(
                            agent.backgroundGradientColors?[3] ?? '#808080'),
                      ],
                    ),
                  ),
                  height: 310,
                  width: 220,
                ),
              ),
            ),
            agent.fullPortrait != null
                ? ShakeWidget(
                    shakeConstant: ShakeVerticalConstant1(),
                    duration: const Duration(milliseconds: 65000),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    child: Image.network(agent.fullPortrait ?? ''))
                : const Placeholder(),
            Positioned(
              bottom: 100,
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
                      agent.displayName ?? 'No Name',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
                      agent.role?.displayName ?? 'No Role',
                      style: const TextStyle(
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
    ),
  );
}
