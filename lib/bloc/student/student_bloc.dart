import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamodemo/model/classroom_details/classroom_details/classroom_details.dart';
import 'package:hamodemo/model/classrooms/classrooms/classroom.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/model/subjects/subjects/subject.dart';
import 'package:hamodemo/services/student/api_services.dart';
import 'package:hamodemo/utils/failures/failures.dart';
import 'package:injectable/injectable.dart';

part 'student_event.dart';
part 'student_state.dart';
part 'student_bloc.freezed.dart';

@injectable
class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final ApiServices _apiServices;

  StudentBloc(this._apiServices) : super(StudentState.inital()) {
    on<_GetStdData>((event, emit) async {
      // if (state.students!.isNotEmpty) {
      //   emit(
      //     StudentState(
      //       isloading: false,
      //       students: state.students,
      //       subjects: state.subjects,
      //       classrooms: state.classrooms,
      //     ),
      //   );
      // }
      emit(state.copyWith(
        isloading: true,
      ));

      final studentsDatas = await _apiServices.getStdData();
      final subjectData = await _apiServices.getSubData();
      final classData = await _apiServices.getClassData();

      emit(studentsDatas.fold(
        (l) => state.copyWith(
          isloading: false,
        ),
        (r) => state.copyWith(
          isloading: false,
          students: r,
          subjects: [],
          classrooms: [],
        ),
      ));
      emit(
        subjectData.fold(
          (l) => state.copyWith(isloading: false),
          (r) => state.copyWith(
            isloading: false,
            students: state.students,
            subjects: r,
            classrooms: [],
          ),
        ),
      );
      emit(
        classData.fold(
          (l) => state.copyWith(isloading: false),
          (r) => state.copyWith(
            isloading: false,
            students: state.students,
            subjects: state.subjects,
            classrooms: r,
          ),
        ),
      );
    });
  }
}
