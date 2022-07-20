import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hamodemo/widgets/app_text.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    final _random = Random();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 30),
                child: const AppSmallText(
                  text: 'My Classroom',
                  size: 25,
                  boldness: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                // flex: 1,
                child: TabBar(
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
              ),
              Container(
                height: 800,
                // width: double.maxFinite,
                child: TabBarView(controller: tabController, children: [
                  ListView.builder(
                    // controller: ScrollController(initialScrollOffset: 2),
                    // physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              // Colors.yellow.shade300,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      );

                      // Card(
                      //     margin: const EdgeInsets.all(8),
                      //     color: Colors.primaries[
                      //         Random().nextInt(Colors.primaries.length)],
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20)),
                      //     elevation: 5,
                      //     child: Container(
                      //       height: 50,
                      //       width: 150,
                      //       decoration: BoxDecoration(
                      //         gradient: LinearGradient(
                      //           colors: [
                      //             Colors.yellow,
                      //             Colors.orangeAccent,
                      //             Colors.yellow.shade300,
                      //           ],
                      //           begin: Alignment.topLeft,
                      //           end: Alignment.bottomRight,
                      //         ),
                      //       ),
                      //     ));
                    },
                  ),
                  Text('2'),
                  Text('3'),
                ]),
              ),
              // Container(
              //   height: 500,
              //   width: double.maxFinite,
              //   child: TabBarView(controller: tabController, children: [
              //     ListView.builder(
              //       physics: AlwaysScrollableScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       shrinkWrap: true,
              //       itemCount: 6,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           margin: EdgeInsets.all(10),
              //           height: 200,
              //           width: 150,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: LinearGradient(
              //               colors: [
              //                 Colors.primaries[
              //                     Random().nextInt(Colors.primaries.length)],
              //                 Colors.primaries[
              //                     Random().nextInt(Colors.primaries.length)],
              //                 // Colors.yellow.shade300,
              //               ],
              //               begin: Alignment.topLeft,
              //               end: Alignment.topRight,
              //             ),
              //           ),
              //         );

              //         // Card(
              //         //     margin: const EdgeInsets.all(8),
              //         //     color: Colors.primaries[
              //         //         Random().nextInt(Colors.primaries.length)],
              //         //     shape: RoundedRectangleBorder(
              //         //         borderRadius: BorderRadius.circular(20)),
              //         //     elevation: 5,
              //         //     child: Container(
              //         //       height: 50,
              //         //       width: 150,
              //         //       decoration: BoxDecoration(
              //         //         gradient: LinearGradient(
              //         //           colors: [
              //         //             Colors.yellow,
              //         //             Colors.orangeAccent,
              //         //             Colors.yellow.shade300,
              //         //           ],
              //         //           begin: Alignment.topLeft,
              //         //           end: Alignment.bottomRight,
              //         //         ),
              //         //       ),
              //         //     ));
              //       },
              //     ),
              //     Text('2'),
              //     Text('3'),
              //   ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
