import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom {
  int? id;
  String? layout;
  String? name;
  int? size;

  Classroom({this.id, this.layout, this.name, this.size});

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return _$ClassroomFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}

@JsonSerializable()
class Classrooms {
  List<Classroom>? classrooms;

  Classrooms({this.classrooms});

  factory Classrooms.fromJson(Map<String, dynamic> json) {
    return _$ClassroomsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomsToJson(this);
}

