// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_tenant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetectTenantResponse _$$_DetectTenantResponseFromJson(Map json) =>
    _$_DetectTenantResponse(
      id: json['id'] as int?,
      studentUsername: json['student_username'] as String?,
      tenantId: json['tenant_id'] as String?,
    );

Map<String, dynamic> _$$_DetectTenantResponseToJson(
        _$_DetectTenantResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_username': instance.studentUsername,
      'tenant_id': instance.tenantId,
    };
