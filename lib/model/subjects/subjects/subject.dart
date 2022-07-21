import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subjects {
  List<Subject>? subjects;

  Subjects({this.subjects});

  factory Subjects.fromJson(Map<String, dynamic> json) {
    return _$SubjectsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectsToJson(this);
}

@JsonSerializable()
class Subject {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  Subject({this.credits, this.id, this.name, this.teacher});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
