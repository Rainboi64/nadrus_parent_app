import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:lazy_evaluation/lazy_evaluation.dart';
import 'package:nadrus_parent_app/extensions/formz_extension.dart';
import 'package:nadrus_parent_app/models/data/user/user.dart';
import 'package:nadrus_parent_app/viewmodels/base_viewmodel.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../models/formz/formz_text.dart';
import '../../../../models/responses/base_response/base_response.dart';
import '../../../../models/responses/login_response/login_response.dart';
import '../../../../models/ui_models/ui_message.dart';
import '../../../../repositories/user_repository.dart';
import '../../../../router/app_router.dart';
import "login_params.dart";

class LoginViewModel extends BaseViewModel {
  final _params = Lazy(() => LoginParams());
  LoginParams get params => _params.value;

  final _userRepository = Lazy(() => UserRepository());
  UserRepository get userRepository => _userRepository.value;

  @override
  void onDispose() {
    // called immediately before the widget is disposed
    super.onDispose();
  }

  /// check if username is valid (not empty, ..
  /// TODO username validation is there more?)
  void attrChanged(MutableLiveData<FormzText> attr, String value) {
    final newValue = FormzText.dirty(value);
    attr.postValue(newValue);
    params.submit.postValue(attr.value.valid);
  }

  login() async {
    String username = params.username.inputValue().trim();
    String password = params.password.inputValue().trim();

    baseParams.loading.postValue(true);

    BaseResponse<LoginResponse> response =
        await userRepository.login(username: username, password: password);

    if (response.data != null) {
      if (response.data!.accessToken != null) {
        // Save access token
        AuthenticationController.login(response.data!);
        appRouter.replaceAll([const Main()]);
      }
    } else {
      baseParams.uiMessage.postValue(
          UiMessage(message: response.message ?? "something_went_wrong".tr()));
    }
    baseParams.loading.postValue(false);
  }

  getUser() async {
    baseParams.loading.postValue(true);

    BaseResponse<User> response = await userRepository.getUser();

    if (response.data != null) {
    } else {
      baseParams.uiMessage.postValue(
          UiMessage(message: response.message ?? "something_went_wrong".tr()));
    }
    baseParams.loading.postValue(false);
  }
}
