import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/models/agent.dart';
import 'package:valorant/srcs/models/gun.dart';
import 'package:valorant/srcs/services/agents.dart';
import 'package:valorant/srcs/services/guns.dart';
import 'package:valorant/srcs/widgets/agent_card.dart';
import 'package:valorant/srcs/widgets/gun_card.dart';
import 'package:valorant/srcs/widgets/map_card.dart';
import 'package:valorant/srcs/widgets/scrollable_cards.dart';

import '../models/map.dart';
import '../services/maps.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Future<List<Agent>> futureAgent;
  late Future<List<Mape>> futureMap;
  late Future<List<Gun>> futureGun;

  List<String> tabNames = const ['Agents', 'Maps', 'Arsenal'];

  List<Agent> agents = [];
  List<Mape> maps = [];
  List<Gun> guns = [];

  Future<void> _loadAgents() async {
    try {
      futureAgent = fetchAgents();
      agents = await futureAgent;
      agents.removeWhere((element) =>
          element.displayName == 'Sova' && element.fullPortrait == null);
      setState(() {});
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  Future _loadMaps() async {
    try {
      futureMap = fetchMaps();
      maps = await futureMap;
      setState(() {});
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  Future _loadGuns() async {
    try {
      futureGun = fetchGuns();
      guns = await futureGun;
      setState(() {});
    } catch (error) {
      debugPrint('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    if (mounted) {
      _loadAgents();
      _loadMaps();
      _loadGuns();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: HexColor('#18273c'),
                stretch: true,
                floating: true,
                pinned: false,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  stretchModes: const [StretchMode.zoomBackground],
                  background: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#18273c'),
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: 'valorantLogo',
                          child: Image.asset(
                            'assets/images/valorant_logo.png',
                            height: 200,
                            width: 200,
                          ),
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Choose Your \n Favourite ',
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                              children: [
                                TextSpan(
                                  text: tabNames[_tabController.index],
                                  style: const TextStyle(
                                    color: Color(0xFFff4458),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                  dividerColor: Colors.grey,
                  indicatorColor: const Color(0xFFff4458),
                  indicatorPadding: const EdgeInsets.only(top: 8),
                  controller: _tabController,
                  tabs: [
                    _buildTab("Agents", 0),
                    _buildTab("Maps", 1),
                    _buildTab("Arsenal", 2),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            agents.isNotEmpty
                ? scrollableCards<Agent>(
                    agents,
                    (Agent agent) => agentCard(agent),
                  )
                : const Placeholder(),
            maps.isNotEmpty
                ? scrollableCards<Mape>(
                    maps,
                    (Mape map) => mapCard(map),
                  )
                : const Placeholder(),
            guns.isNotEmpty
                ? scrollableCards<Gun>(
                    guns,
                    (Gun gun) => gunCard(gun),
                  )
                : const Placeholder(),
          ]),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = _tabController.index == index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFFff4458) : const Color(0xFFFFFFFF),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
