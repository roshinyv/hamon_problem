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
    int buttonca = 8;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 120,
          ),
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
                          children: [AppLargeText(text: subject.name!)],
                        ),
                      ),
                      DetailText(
                        text1: 'Credits :',
                        text2: subject.credits.toString(),
                      ),
                      DetailText(
                        text1: 'Teacher :',
                        text2: subject.teacher!,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.all(0.0),
                              elevation: 5,
                            ),
                            onPressed: () {
                              print('add button');
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(
                                    colors: [Colors.blue, Colors.indigoAccent]),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                constraints:
                                    const BoxConstraints(minWidth: 88.0),
                                child: const Text('Add',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.all(0.0),
                              elevation: 5,
                            ),
                            onPressed: () {
                              print('add button');
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: buttonca < 5
                                      ? LinearGradient(colors: [
                                          Colors.red,
                                          Colors.red.shade900
                                        ])
                                      : LinearGradient(colors: [
                                          Colors.grey,
                                          Colors.grey.shade500
                                        ])),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                constraints:
                                    const BoxConstraints(minWidth: 88.0),
                                child: const Text('Delete',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        ],
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
