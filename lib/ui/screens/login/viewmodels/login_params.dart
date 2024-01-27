import 'package:nadrus_parent_app/extensions/live_data_extension.dart';

import '../../../../models/formz/formz_text.dart';
import '../../../../models/ui_models/ui_message.dart';

class LoginParams {
  /// username text field
  final username =
      const FormzText.pure("parentfortwo").liveData; //"parentfortwo"

  /// password text field
  final password = const FormzText.pure("123456789").liveData; //"123456789"

  /// form enabled for submit
  final submit = false.liveData;

  /// UI [SnackBar] message
  final uiMessage = UiMessage().liveData;
}
