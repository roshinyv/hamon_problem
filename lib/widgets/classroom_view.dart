import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamodemo/bloc/student/student_bloc.dart';
import 'package:hamodemo/model/classrooms/classrooms/classroom.dart';
import 'package:hamodemo/pages/classroom_page.dart';

import 'package:hamodemo/widgets/app_text.dart';

class ClassroomTabView extends StatelessWidget {
  const ClassroomTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state.isloading) {
          return const Center(
              child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ));
        }
        final stateData = state.classrooms;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: stateData!.length,
          itemBuilder: (context, index) {
            print(stateData.length.toString());
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClassroomPage(
                        indexId: index,
                      ),
                    ));
              },
              child: CardView(classroom: stateData[index]),
            );
          },
        );
      },
    );
  }
}

class CardView extends StatelessWidget {
  final Classroom classroom;
  const CardView({Key? key, required this.classroom}) : super(key: key);

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
            end: const Alignment(0.8, 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      const AppLargeText(
                        text: "Name : ",
                        size: 18,
                      ),
                      AppLargeText(
                        text: classroom.name!,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const AppSmallText(
                        text: 'Layout : ',
                        size: 15,
                      ),
                      AppSmallText(text: classroom.layout!),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const AppSmallText(
                        text: 'Size : ',
                        size: 15,
                      ),
                      AppSmallText(text: classroom.size.toString()),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
