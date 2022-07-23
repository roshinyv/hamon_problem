// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassroomDetails _$ClassroomDetailsFromJson(Map<String, dynamic> json) =>
    ClassroomDetails(
        id: json['id'] as int?,
        layout: json['layout'] as String?,
        name: json['name'] as String?,
        size: json['size'] as int?,
        subject: json['subject'] == "" ? 0 : json['subject']);

Map<String, dynamic> _$ClassroomDetailsToJson(ClassroomDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'layout': instance.layout,
      'name': instance.name,
      'size': instance.size,
      'subject': instance.subject,
    };
