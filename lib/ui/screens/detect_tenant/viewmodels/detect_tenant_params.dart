import 'package:nadrus_parent_app/extensions/live_data_extension.dart';

import '../../../../models/formz/formz_text.dart';
import '../../../../models/ui_models/ui_message.dart';

class DetectTenantParams {
  /// username text field
  final username =
      const FormzText.pure("parentfortwo").liveData; //"parentfortwo"

  /// form enabled for submit
  final submit = false.liveData;

  /// request in progress
  final loading = false.liveData;

  /// UI [SnackBar] message
  final uiMessage = UiMessage().liveData;
}
