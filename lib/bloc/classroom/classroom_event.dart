part of 'classroom_bloc.dart';

@freezed
class ClassroomEvent with _$ClassroomEvent {
  const factory ClassroomEvent.started({required int indexId}) = _Started;
  const factory ClassroomEvent.postSub({
    required int subId,
    required int pageId,
  }) = _PostSub;
}
