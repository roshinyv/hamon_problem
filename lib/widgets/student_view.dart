import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamodemo/bloc/student/student_bloc.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/pages/detailspage.dart';
import 'package:hamodemo/pages/student_page.dart';
import 'package:hamodemo/widgets/app_text.dart';

class StudentTabView extends StatelessWidget {
  const StudentTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state.isloading) {
          return const Center(
              child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ));
        }
        final stdData = state.students;
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: stdData!.length,
          itemBuilder: (context, index) {
            print(stdData.length.toString());
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentPage(
                        student: stdData[index],
                      ),
                    ));
              },
              child: CardView(student: stdData[index]),
            );
          },
        );
      },
    );
  }
}

class CardView extends StatelessWidget {
  final Student student;
  const CardView({Key? key, required this.student}) : super(key: key);

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
                        text: student.name!,
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
                        text: 'Age : ',
                        size: 15,
                      ),
                      AppSmallText(text: student.age.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const AppSmallText(
                        text: 'Email : ',
                        size: 15,
                      ),
                      AppSmallText(text: student.email!),
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
