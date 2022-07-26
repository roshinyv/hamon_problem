part of 'student_bloc.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState({
    required bool isloading,
    List<Student>? students,
    List<Subject>? subjects,
    List<Classroom>? classrooms,
  }) = _StudentState;

  factory StudentState.inital() {
    return const StudentState(
      isloading: false,
      students: [],
      subjects: [],
      classrooms: [],
    );
  }
}
