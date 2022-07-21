// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Students _$StudentsFromJson(Map<String, dynamic> json) => Students(
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentsToJson(Students instance) => <String, dynamic>{
      'students': instance.students,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      age: json['age'] as int?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'age': instance.age,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
    };
