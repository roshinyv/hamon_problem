import 'package:hamodemo/utils/strings.dart';

class Apiendpoints {
  static const students = "$baseUrl '/students/$apiKey'";
  static const String classroom = baseUrl + "classrooms/";
  static const String classroomdetail = classroom + "?api_key=$apiKey";
}
