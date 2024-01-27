import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_note.freezed.dart';
part 'teacher_note.g.dart';

// ----------(json)----------
/*
 {
      "id": 1,
      "content": "نبيهة اثناء الحصة 🤣",
      "type": "POSITIVE",
      "student_id": 3,
      "creator_type": "App\\Models\\Teachers\\Teacher",
      "creator_id": 1,
      "class_id": null,
      "created_at": "2023-07-22T10:10:07.000000Z",
      "updated_at": "2023-07-22T10:10:07.000000Z"
    }
*/
// --------------------------

@freezed
class TeacherNote with _$TeacherNote {
  const factory TeacherNote({
    dynamic id,
    String? content,
    String? type,
    dynamic subjectId,
    String? creatorType,
    dynamic creatorId,
    dynamic classId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TeacherNote;

  factory TeacherNote.fromJson(Map<String, dynamic> json) =>
      _$TeacherNoteFromJson(json);
}
