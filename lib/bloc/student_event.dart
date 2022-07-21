part of 'student_bloc.dart';

@freezed
class StudentEvent with _$StudentEvent {
  const factory StudentEvent.getStdData() = _GetStdData;
  const factory StudentEvent.getSubData() = _GetSubData;
  const factory StudentEvent.getClassData() = _GetClassData;

}
