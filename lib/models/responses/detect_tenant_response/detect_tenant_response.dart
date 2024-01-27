import 'package:freezed_annotation/freezed_annotation.dart';

part 'detect_tenant_response.freezed.dart';
part 'detect_tenant_response.g.dart';

// ----------(json)----------
/*
{
  "id": 3,
  "student_username": "thuraya",
  "tenant_id": "alawael"
}
*/
// --------------------------

@freezed
class DetectTenantResponse with _$DetectTenantResponse {
  const factory DetectTenantResponse({
    int? id,
    String? studentUsername,
    String? tenantId,
  }) = _DetectTenantResponse;

  factory DetectTenantResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectTenantResponseFromJson(json);
}
