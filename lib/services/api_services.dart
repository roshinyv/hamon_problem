import 'package:dartz/dartz.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/utils/failures/failures.dart';

abstract class ApiServices {
  Future<Either<MainFailures, List<Student>>> getStdData();
}
