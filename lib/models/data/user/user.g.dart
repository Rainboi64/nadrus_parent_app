// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map json) => _$_User(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      username: json['username'] as String?,
      fcmToken: json['fcm_token'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      parentId: json['parent_id'] as int?,
      sectionId: json['section_id'] as int?,
      students: (json['students'] as List<dynamic>?)
              ?.map(
                  (e) => Student.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'username': instance.username,
      'fcm_token': instance.fcmToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'parent_id': instance.parentId,
      'section_id': instance.sectionId,
      'students': instance.students.map((e) => e.toJson()).toList(),
    };
