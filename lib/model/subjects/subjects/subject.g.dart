// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subjects _$SubjectsFromJson(Map<String, dynamic> json) => Subjects(
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      'subjects': instance.subjects,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      credits: json['credits'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      teacher: json['teacher'] as String?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'credits': instance.credits,
      'id': instance.id,
      'name': instance.name,
      'teacher': instance.teacher,
    };
