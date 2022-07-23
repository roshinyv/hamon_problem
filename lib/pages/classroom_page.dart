import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamodemo/bloc/classroom/classroom_bloc.dart';
import 'package:hamodemo/utils/validators.dart';
import 'package:hamodemo/widgets/app_text.dart';

class ClassroomPage extends StatefulWidget {
  final int indexId;
  const ClassroomPage({
    Key? key,
    required this.indexId,
  }) : super(key: key);

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<ClassroomBloc>(context)
          .add(ClassroomEvent.started(indexId: widget.indexId));
    });
    int buttonca = 8;
    final int pageIndex = widget.indexId;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(child: BlocBuilder<ClassroomBloc, ClassroomState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (classroomDetails) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // height: 150,
                      // width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70
                      
                          ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppLargeText(text: classroomDetails.name!)
                              ],
                            ),
                          ),
                          DetailText(
                            text1: 'Size :',
                            text2: classroomDetails.size.toString(),
                          ),
                          DetailText(
                            text1: 'Layout :',
                            text2: classroomDetails.layout!,
                          ),
                          classroomDetails.subject == 0
                              ? Container()
                              : DetailText(
                                  text1: 'Subject :',
                                  text2: classroomDetails.subject.toString(),
                                ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 1.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      key: _formKey,
                                      keyboardType: TextInputType.number,
                                      controller: textId,
                                      validator: (value) {
                                        return Validator.validateName(
                                            value ?? "");
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Enter Subject ID",
                                        contentPadding: EdgeInsets.only(
                                          left: 15,
                                        ),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                  // if (_formKey.currentState!.validate()) {
                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(
                                  //     content: const Text('Processing Data'),
                                  //     backgroundColor: Colors.green.shade300,
                                  //   ));
                                  //   ScaffoldMessenger.of(context)
                                  //       .hideCurrentSnackBar();
                                  //   if (textId == 0) {
                                  //     ScaffoldMessenger.of(context)
                                  //         .showSnackBar(SnackBar(
                                  //       content:
                                  //           Text('Please enter subject ID'),
                                  //       backgroundColor: Colors.red.shade300,
                                  //     ));
                                  //   }
                                  // }
                                  print('add button');
                                  int txted = int.parse(textId.text);
                                  BlocProvider.of<ClassroomBloc>(context).add(
                                      ClassroomEvent.postSub(
                                          subId: txted, pageId: pageIndex));
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: const LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.indigoAccent
                                    ]),
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
                                  print('del button');
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
                ],
              );
            },
          );
        },
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
