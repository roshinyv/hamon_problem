import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hamodemo/model/classroom_details/classroom_details/classroom_details.dart';
import 'package:hamodemo/services/classroom/class_services.dart';
import 'package:hamodemo/utils/api_endpoints.dart';
import 'package:hamodemo/utils/failures/failures.dart';
import 'package:hamodemo/utils/strings.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClassServices)
class ClassRepo implements ClassServices {
  final Dio _dio = Dio();

  @override
  Future<Either<MainFailures, ClassroomDetails>> getClassId(
      {required int indexId}) async {
    final int id = indexId + 1;
    try {
      final Response response =
          await _dio.get(Apiendpoints.classroom + '$id?api_key=$apiKey');
      if (response.statusCode == 200) {
        final classDat = ClassroomDetails.fromJson(response.data);

        return Right(classDat);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }

  @override
  Future<Either<MainFailures, ClassroomDetails>> postClassStd(
      {required int pageId, required int subId}) async {
    final int id = pageId + 1;
    try {
      var formData = FormData.fromMap({"subject": subId});
      final Response response = await _dio.patch(
        Apiendpoints.classroom + '$id?api_key=$apiKey',
        data: formData,
      );

      if (response.statusCode == 200) {
        final classDat = ClassroomDetails.fromJson(response.data);
        return Right(classDat);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
