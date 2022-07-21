import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/services/api_services.dart';
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
      emit(state.copyWith(
        isloading: true,
      ));
      final Either<MainFailures, List<Student>> studentsDatas =
          await _apiServices.getStdData();
      log(studentsDatas.toString());
      emit(studentsDatas.fold(
        (l) => state.copyWith(
          isloading: false,
        ),
        (r) => state.copyWith(
          isloading: false,
          students: r,
        ),
      ));
    });
  }
}
