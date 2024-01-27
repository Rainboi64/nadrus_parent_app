import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../../../models/data/teacher_note/teacher_note.dart';

class TeachersFeedbackParams {
  MutableLiveData<List<TeacherNote>> teacherNotes = MutableLiveData(value: []);
}
