import 'package:flutter/material.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/widgets/app_text.dart';

class StudentPage extends StatelessWidget {
  final Student student;

  const StudentPage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int buttonca = 8;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Stack(
            children: [
              Card(
                elevation: 8,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  // height: 150,
                  // width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70
                      // gradient: LinearGradient(
                      //   colors: [
                      //     // Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      //     // Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      //     Colors.blue,
                      //     Colors.indigo.shade700
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: const Alignment(0.8, 1),
                      // ),
                      ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [AppLargeText(text: student.name!)],
                        ),
                      ),
                      DetailText(
                        text1: 'Age :',
                        text2: student.age.toString(),
                      ),
                      DetailText(
                        text1: 'email :',
                        text2: student.email!,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              profileImg(),
            ],
          ),
        ],
      )),
    );
  }

  Row profileImg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              image:
                  const DecorationImage(image: AssetImage('assets/img1.png')),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 2), blurRadius: 8, color: Colors.grey)
              ],
              color: Colors.blue.shade500,
              borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}

class DetailText extends StatelessWidget {
  final String text1;
  final String text2;

  const DetailText({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppSmallText(
            text: text1,
            size: 15,
            color: Colors.grey,
          ),
          AppSmallText(
            text: text2,
          )
        ],
      ),
    );
  }
}
