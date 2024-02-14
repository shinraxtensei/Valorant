import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/models/agent.dart';
import 'package:valorant/srcs/screens/agent.dart';

Widget agentCard(Agent agent) {
  return Builder(builder: (context) {
    return GestureDetector(
      child: InkWell(
        onTap: () {
          debugPrint('Agent: ${agent.displayName}');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AgentScreen(agent: agent)));
        },
        child: Center(
          child: Transform.scale(
            scale: 1.15,
            child: Card(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
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
                                    '#ffffff'),
                                HexColor(agent.backgroundGradientColors?[1] ??
                                    '#ffffff'),
                                HexColor(agent.backgroundGradientColors?[2] ??
                                    '#ffffff'),
                                HexColor(agent.backgroundGradientColors?[3] ??
                                    '#ffffff'),
                              ],
                            ),
                          ),
                          height: 310,
                          width: 220,
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: '${agent.uuid}-fullPortrait',
                    child: agent.fullPortrait != null
                        ? ShakeWidget(
                            shakeConstant: ShakeVerticalConstant1(),
                            duration: const Duration(milliseconds: 65000),
                            autoPlay: true,
                            enableWebMouseHover: true,
                            child: Image.network(agent.fullPortrait ?? ''))
                        : const Placeholder(),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 100,
                    right: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: HexColor('#ffffff').withOpacity(0.1),
                      ),
                      child: Column(children: [
                        Text(
                          agent.displayName ?? 'No Name',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: false,
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 10,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });
}

class AgentBiography extends StatelessWidget {
  const AgentBiography(this.agent, {super.key});

  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '// Biography',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                agent.description ?? 'No description',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialAbilities extends StatelessWidget {
  const SpecialAbilities(this.agent, {super.key});

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '// Special Abilities',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          abilityCard(agent.abilities![0]),
          abilityCard(agent.abilities![1]),
          abilityCard(agent.abilities![2]),
          abilityCard(agent.abilities![3]),
        ],
      ),
    );
  }

  Widget abilityCard(Ability ability) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: HexColor('#2F3D50'),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: HexColor('#ffffff').withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    ability.displayIcon ?? '',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ability.displayName ?? 'No Name',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ability.description ?? 'No Description',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
