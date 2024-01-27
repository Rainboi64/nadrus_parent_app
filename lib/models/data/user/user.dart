import 'package:freezed_annotation/freezed_annotation.dart';

import '../student/student.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// ----------(json)----------
/*
{
    "id": 3,
    "username": "parentfortwo",
    "fcm_token": null,
    "phone_number": "+963956124584",
    "created_at": "2023-06-16T14:28:34.000000Z",
    "updated_at": "2023-09-09T11:58:24.000000Z",
    "students": [
      {
        "id": 3,
        "first_name": "ثريا",
        "last_name": "الحسني",
        "phone_number": "+963956124584",
        "username": "thuraya",
        "fcm_token": null,
        "created_at": "2023-06-16T14:28:34.000000Z",
        "updated_at": "2023-06-29T13:08:22.000000Z",
        "parent_id": 3,
        "section_id": 1
      },
      {
        "id": 4,
        "first_name": "Yahya",
        "last_name": "Housh",
        "phone_number": "+963934054926",
        "username": "yahya",
        "fcm_token": null,
        "created_at": "2023-07-01T13:00:37.000000Z",
        "updated_at": "2023-07-01T13:00:37.000000Z",
        "parent_id": 3,
        "section_id": 1
      }
    ]
}
*/
// --------------------------

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? username,
    String? fcmToken,
    String? createdAt,
    String? updatedAt,
    int? parentId,
    int? sectionId,
    @JsonKey(defaultValue: []) required List<Student> students,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
