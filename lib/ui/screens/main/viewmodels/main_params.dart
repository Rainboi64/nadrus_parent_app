import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:nadrus_parent_app/models/data/student/student.dart';

import '../../../../models/data/user/user.dart';

class MainParams {
  MutableLiveData<User?> user = MutableLiveData(value: null);

  MutableLiveData<List<Student>> students = MutableLiveData(value: []);

  MutableLiveData<bool?> hasMoreThanOneChild = MutableLiveData(value: null);
}
