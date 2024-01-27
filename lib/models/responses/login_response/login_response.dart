import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data_models.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

// ----------(json)----------
/*
{
  "access_token": "5|nByNO0eagaIf82LhDubxzfleidh0hkg5pC07A0h9",
  "user": {
    "id": 1,
    "full_name": "Yahya Housh",
    "username": "yahya",
    "created_at": "2023-05-07T04:20:37.000000Z",
    "updated_at": "2023-05-07T04:20:37.000000Z"
  }
}
*/
// --------------------------

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? accessToken,
    User? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
