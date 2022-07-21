import 'package:dartz/dartz.dart';
import 'package:hamodemo/model/classrooms/classrooms/classroom.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/model/subjects/subjects/subject.dart';
import 'package:hamodemo/utils/failures/failures.dart';

abstract class ApiServices {
  Future<Either<MainFailures, List<Student>>> getStdData();
  Future<Either<MainFailures, List<Subject>>> getSubjectData();
  Future<Either<MainFailures, List<Classroom>>> getClassroomData();
}
