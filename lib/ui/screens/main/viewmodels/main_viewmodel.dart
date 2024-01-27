import 'package:easy_localization/easy_localization.dart';
import 'package:lazy_evaluation/lazy_evaluation.dart';
import 'package:nadrus_parent_app/viewmodels/base_viewmodel.dart';

import '../../../../models/data/user/user.dart';
import '../../../../models/responses/base_response/base_response.dart';
import '../../../../models/ui_models/ui_message.dart';
import '../../../../repositories/user_repository.dart';
import "main_params.dart";

class MainViewModel extends BaseViewModel {
  final _params = Lazy(() => MainParams());
  MainParams get params => _params.value;

  final _userRepository = Lazy(() => UserRepository());
  UserRepository get userRepository => _userRepository.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
    // called immediately after the widget is allocated in memory.
  }

  @override
  void onDispose() {
    // called immediately before the widget is disposed
    super.onDispose();
  }

  getUser() async {
    baseParams.loading.postValue(true);

    BaseResponse<User> response = await userRepository.getUser();

    if (response.data != null) {
      params.user.postValue(response.data!);
      if (response.data!.students.length > 1) {
        params.hasMoreThanOneChild.postValue(true);
      }
      if (response.data!.students.length == 1) {
        params.hasMoreThanOneChild.postValue(false);
      }
      params.students.postValue(response.data!.students);
    } else {
      baseParams.uiMessage.postValue(
          UiMessage(message: response.message ?? "something_went_wrong".tr()));
    }
    baseParams.loading.postValue(false);
  }
}
