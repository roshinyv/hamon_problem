import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamodemo/bloc/student/student_bloc.dart';
import 'package:hamodemo/pages/detailspage.dart';
import 'package:hamodemo/widgets/app_text.dart';
import 'package:hamodemo/widgets/classroom_view.dart';
import 'package:hamodemo/widgets/student_view.dart';
import 'package:hamodemo/widgets/subject_view.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<StudentBloc>(context)
          .add(const StudentEvent.getStdData());
    });
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
                children: const [
                  StudentTabView(),
                  SubjectTabView(),
                  ClassroomTabView(),
                ],
              ),
            )),
      ),
    );
  }
}
