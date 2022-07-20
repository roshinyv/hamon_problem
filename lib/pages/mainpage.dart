import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hamodemo/pages/detailspage.dart';
import 'package:hamodemo/widgets/app_text.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, left: 30),
                        child: const AppLargeText(
                          text: 'My Classroom',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TabBar(
                        controller: tabController,
                        indicatorColor: Colors.indigo,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(
                            text: 'Students',
                          ),
                          Tab(
                            text: 'Subjects',
                          ),
                          Tab(
                            text: 'Classroom',
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ];
            },
            body: Container(
              child: TabBarView(
                controller: tabController,
                children: [TabView(), TabView(), TabView()],
              ),
            )),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ));
            },
            child: CardView());
      },
    );
  }
}

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ],
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
          ),
        ),
        child: Container(),
      ),
    );
  }
}
