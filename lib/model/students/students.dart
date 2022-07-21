import 'package:json_annotation/json_annotation.dart';

part 'students.g.dart';

@JsonSerializable()
class Students {
  List<Student>? students;

  Students({this.students});

  factory Students.fromJson(Map<String, dynamic> json) {
    return _$StudentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentsToJson(this);
}

@JsonSerializable()
class Student {
  int? age;
  String? email;
  int? id;
  String? name;

  Student({this.age, this.email, this.id, this.name});

  factory Student.fromJson(Map<String, dynamic> json) {
    return _$StudentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
