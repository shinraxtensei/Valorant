import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/models/agent.dart';
import 'package:valorant/srcs/widgets/agent_card.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key, required this.agent});

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            leading: RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Hero(
                  tag: 'valorantLogo',
                  child: Image.asset(
                    'assets/images/valorant_logo.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.passthrough,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: agent.displayIcon != null
                        ? Image.network(
                            agent.displayIcon ?? '',
                            height: 250,
                            width: 250,
                          )
                        : const Placeholder(),
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: '${agent.uuid}-backgroundGradient',
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                HexColor(agent.backgroundGradientColors?[0] ??
                                        '#808080')
                                    .withOpacity(0.8),
                                HexColor(agent.backgroundGradientColors?[1] ??
                                        '#808080')
                                    .withOpacity(0.7),
                                HexColor(agent.backgroundGradientColors?[2] ??
                                        '#808080')
                                    .withOpacity(0.6),
                                HexColor(agent.backgroundGradientColors?[3] ??
                                        '#808080')
                                    .withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: '${agent.uuid}-fullPortrait',
                    child: agent.fullPortrait != null
                        ? Transform.scale(
                            scale: 1.5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: ShakeWidget(
                                  shakeConstant: ShakeVerticalConstant1(),
                                  duration: const Duration(milliseconds: 65000),
                                  autoPlay: true,
                                  enableWebMouseHover: true,
                                  child:
                                      Image.network(agent.fullPortrait ?? '')),
                            ),
                          )
                        : const Placeholder(),
                  ),
                  Positioned(
                    bottom: 50,
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
                              fontSize: 24,
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
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AgentBiography(agent),
          SpecialAbilities(agent),
          // const SliverToBoxAdapter(child: Placeholder()),
        ],
      ),
    );
  }
}
