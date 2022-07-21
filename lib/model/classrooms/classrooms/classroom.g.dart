// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      id: json['id'] as int?,
      layout: json['layout'] as String?,
      name: json['name'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'name': instance.name,
      'size': instance.size,
    };

Classrooms _$ClassroomsFromJson(Map<String, dynamic> json) => Classrooms(
      classrooms: (json['classrooms'] as List<dynamic>?)
          ?.map((e) => Classroom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassroomsToJson(Classrooms instance) =>
    <String, dynamic>{
      'classrooms': instance.classrooms,
    };
