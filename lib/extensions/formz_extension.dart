import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:formz/formz.dart';

extension LiveDataInputUtils on LiveData<FormzInput> {
  bool isNotEmpty() {
    return value.value.isNotEmpty;
  }

  String inputValue() {
    return value.value;
  }
}
