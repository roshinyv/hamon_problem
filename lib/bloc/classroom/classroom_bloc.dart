import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamodemo/model/classroom_details/classroom_details/classroom_details.dart';
import 'package:hamodemo/services/classroom/class_services.dart';
import 'package:hamodemo/utils/failures/failures.dart';
import 'package:injectable/injectable.dart';

part 'classroom_event.dart';
part 'classroom_state.dart';
part 'classroom_bloc.freezed.dart';

@injectable
class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  final ClassServices classServices;
  ClassroomBloc(this.classServices) : super(const _Initial()) {
    on<_Started>((event, emit) async {
      emit(const ClassroomState.loading());
      try {
        final Either<MainFailures, ClassroomDetails> summary =
            await classServices.getClassId(indexId: event.indexId);
        emit(summary.fold(
          (l) => const ClassroomState.loading(),
          (r) => ClassroomState.loaded(r),
        ));
      } catch (_) {}
    });
    on<_PostSub>((event, emit) async {
      emit(const ClassroomState.loading());
      try {
        final Either<MainFailures, ClassroomDetails> summary =
            await classServices.postClassStd(
                subId: event.subId, pageId: event.pageId);
        emit(summary.fold(
          (l) => const ClassroomState.loading(),
          (r) => ClassroomState.loaded(r),
        ));
      } catch (_) {}
    });
  }
}
