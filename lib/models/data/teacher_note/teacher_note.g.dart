// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeacherNote _$$_TeacherNoteFromJson(Map json) => _$_TeacherNote(
      id: json['id'],
      content: json['content'] as String?,
      type: json['type'] as String?,
      subjectId: json['subject_id'],
      creatorType: json['creator_type'] as String?,
      creatorId: json['creator_id'],
      classId: json['class_id'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_TeacherNoteToJson(_$_TeacherNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'type': instance.type,
      'subject_id': instance.subjectId,
      'creator_type': instance.creatorType,
      'creator_id': instance.creatorId,
      'class_id': instance.classId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
