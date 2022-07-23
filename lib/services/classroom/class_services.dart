import 'package:dartz/dartz.dart';
import 'package:hamodemo/model/classroom_details/classroom_details/classroom_details.dart';
import 'package:hamodemo/utils/failures/failures.dart';

abstract class ClassServices {
  Future<Either<MainFailures, ClassroomDetails>> getClassId({
    required int indexId,
  });
  Future<Either<MainFailures, ClassroomDetails>> postClassStd({
    required int pageId,
    required int subId,
  });
}
