import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valorant/srcs/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
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
                    decoration:  BoxDecoration(
                      color: HexColor('#18273c'),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/app/valorant_logo.png',
                          height: 200,
                          width: 200,
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
                              children: const [
                                TextSpan(
                                  text: 'Agents',
                                  style: TextStyle(
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
          body: TabBarView(
            
            controller: _tabController,
            children: const [CustomCard(), Placeholder(), Placeholder()],
          ),
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
