import 'package:flutter/material.dart';
import 'package:hamodemo/model/subjects/subjects/subject.dart';
import 'package:hamodemo/widgets/app_text.dart';

class SubjectPage extends StatelessWidget {
  final Subject subject;

  const SubjectPage({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white70),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [AppLargeText(text: subject.name!)],
                      ),
                      DetailText(
                        text1: 'Credits :',
                        text2: subject.credits.toString(),
                      ),
                      DetailText(
                        text1: 'Teacher :',
                        text2: subject.teacher!,
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
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
