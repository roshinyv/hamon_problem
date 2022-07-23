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
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<ClassroomBloc>(context)
          .add(ClassroomEvent.started(indexId: widget.indexId));
    });
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70),
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
                          Form(
                            key: _formKey,
                            child: Container(
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
                                        keyboardType: TextInputType.number,
                                        controller: _textController,
                                        validator: (value) {
                                          return Validator.validateNo(
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
                                  if (_textController.text.isNotEmpty) {
                                    final chkTxt =
                                        int.parse(_textController.text);
                                    if (chkTxt <= 6) {
                                      BlocProvider.of<ClassroomBloc>(context)
                                          .add(ClassroomEvent.postSub(
                                              subId: int.parse(
                                                  _textController.text),
                                              pageId: pageIndex));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: const Text('No Subject Found'),
                                        backgroundColor: Colors.red.shade300,
                                      ));
                                    }
                                  } else {
                                    _formKey.currentState!.validate();
                                  }
                                  print('add button');
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    gradient: classroomDetails.subject == 0
                                        ? LinearGradient(colors: [
                                            Colors.blue,
                                            Colors.indigo.shade700
                                          ])
                                        : LinearGradient(colors: [
                                            Colors.green,
                                            Colors.green.shade700
                                          ]),
                                  ),
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      constraints:
                                          const BoxConstraints(minWidth: 88.0),
                                      child: classroomDetails.subject == 0
                                          ? const Text('Add',
                                              textAlign: TextAlign.center)
                                          : const Text('Update',
                                              textAlign: TextAlign.center)),
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
