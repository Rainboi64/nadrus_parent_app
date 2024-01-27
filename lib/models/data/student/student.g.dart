// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map json) => _$_Student(
      id: json['id'],
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      username: json['username'] as String?,
      fcmToken: json['fcm_token'],
      globalId: json['global_id'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      parentId: json['parent_id'],
      sectionId: json['section_id'],
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'fcm_token': instance.fcmToken,
      'global_id': instance.globalId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'parent_id': instance.parentId,
      'section_id': instance.sectionId,
      'selected': instance.selected,
    };
