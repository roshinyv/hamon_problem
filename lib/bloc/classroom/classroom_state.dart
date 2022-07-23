part of 'classroom_bloc.dart';

@freezed
class ClassroomState with _$ClassroomState {
  const factory ClassroomState.initial() = _Initial;
  const factory ClassroomState.loading() = _Loading;
  const factory ClassroomState.loaded(ClassroomDetails classroomDetails) = _Loaded;
  
}
