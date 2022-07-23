import 'package:json_annotation/json_annotation.dart';

part 'classroom_details.g.dart';

@JsonSerializable()
class ClassroomDetails {
  int? id;
  String? layout;
  String? name;
  int? size;
  int subject;

  ClassroomDetails({
    this.id,
    this.layout,
    this.name,
    this.size,
    this.subject = 0,
  });

  factory ClassroomDetails.fromJson(Map<String, dynamic> json) {
    return _$ClassroomDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassroomDetailsToJson(this);
}
