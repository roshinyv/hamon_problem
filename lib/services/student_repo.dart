import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hamodemo/model/classrooms/classrooms/classroom.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/model/subjects/subjects/subject.dart';
import 'package:hamodemo/services/api_services.dart';
import 'package:hamodemo/utils/api_endpoints.dart';
import 'package:hamodemo/utils/failures/failures.dart';
import 'package:hamodemo/utils/strings.dart';
import 'package:injectable/injectable.dart';

// class StudentRepo {
//   Dio _dio = Dio();

//   getStudents() async {
//     final Response response = await _dio.get(baseUrl);
//     if (response.statusCode == 200) {
//       final result = response.data['students'];
//       final resultData = Student.fromJson(result);
//       return Student();
//     }
//   }
// }
@LazySingleton(as: ApiServices)
class ApiRepo implements ApiServices {
  final Dio _dio = Dio();

  @override
  Future<Either<MainFailures, List<Student>>> getStdData() async {
    try {
      final Response response = await _dio.get(
          'https://hamon-interviewapi.herokuapp.com/students/?api_key=1527E');
      if (response.statusCode == 200) {
        final studentlist = (response.data['students'] as List).map((e) {
          return Student.fromJson(e);
        }).toList();
        print(response.data);
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, List<Subject>>> getSubjectData() async {
    try {
      final Response response = await _dio.get(
          'https://hamon-interviewapi.herokuapp.com/subjects/?api_key=1527E');
      if (response.statusCode == 200) {
        final studentlist = (response.data['subjects'] as List).map((e) {
          return Subject.fromJson(e);
        }).toList();
        print(response.data);
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, List<Classroom>>> getClassroomData() async {
    try {
      final Response response = await _dio.get(
          'https://hamon-interviewapi.herokuapp.com/classrooms/?api_key=1527E');
      if (response.statusCode == 200) {
        final studentlist = (response.data['classrooms'] as List).map((e) {
          return Classroom.fromJson(e);
        }).toList();
        print(response.data);
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
