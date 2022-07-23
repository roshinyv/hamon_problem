import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hamodemo/model/classrooms/classrooms/classroom.dart';
import 'package:hamodemo/model/students/students.dart';
import 'package:hamodemo/model/subjects/subjects/subject.dart';
import 'package:hamodemo/services/student/api_services.dart';
import 'package:hamodemo/utils/failures/failures.dart';
import 'package:injectable/injectable.dart';

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
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, List<Subject>>> getSubData() async {
    try {
      final Response response = await _dio.get(
          'https://hamon-interviewapi.herokuapp.com/subjects/?api_key=1527E');
      if (response.statusCode == 200) {
        final studentlist = (response.data['subjects'] as List).map((e) {
          return Subject.fromJson(e);
        }).toList();
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, List<Classroom>>> getClassData() async {
    try {
      final Response response = await _dio.get(
          'https://hamon-interviewapi.herokuapp.com/classrooms/?api_key=1527E');
      if (response.statusCode == 200) {
        final studentlist = (response.data['classrooms'] as List).map((e) {
          return Classroom.fromJson(e);
        }).toList();
        return Right(studentlist);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

}
