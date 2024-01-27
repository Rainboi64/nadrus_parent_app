import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

// ----------(json)----------
/*
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
*/
// --------------------------

@freezed
class Student with _$Student {
  const factory Student({
    dynamic id,
    String? firstName,
    String? lastName,
    String? username,
    dynamic fcmToken,
    dynamic globalId,
    String? createdAt,
    String? updatedAt,
    dynamic parentId,
    dynamic sectionId,
    @Default(false) bool selected,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}

extension StudentExtension on Student {
  String first() => firstName ?? "";
  String last() => lastName ?? "";
  String fullName() => "${first()} ${last()}";
}
