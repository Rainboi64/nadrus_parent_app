import 'package:easy_localization/easy_localization.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:lazy_evaluation/lazy_evaluation.dart';
import 'package:nadrus_parent_app/extensions/formz_extension.dart';

import '../../../../controllers/tenant_controller.dart';
import '../../../../models/data_models.dart';
import '../../../../models/formz/formz_text.dart';
import '../../../../models/responses/base_response/base_response.dart';
import '../../../../models/ui_models/ui_message.dart';
import '../../../../repositories/user_repository.dart';
import '../../../../router/app_router.dart';
import '../../../../viewmodels/base_viewmodel.dart';
import "detect_tenant_params.dart";

class DetectTenantViewModel extends BaseViewModel {
  final _params = Lazy(() => DetectTenantParams());
  DetectTenantParams get params => _params.value;

  final _userRepository = Lazy(() => UserRepository());
  UserRepository get userRepository => _userRepository.value;

  @override
  void onInit() {
    super.onInit();
    // called immediately after the widget is allocated in memory.
  }

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

  detectTenant() async {
    baseParams.loading.postValue(true);
    String username = params.username.inputValue().trim();

    BaseResponse<DetectTenantResponse> response =
        await userRepository.detectTenant(username: username);

    if (response.data != null) {
      if (response.data?.tenantId != null) {
        await TenantController.saveTenant(response.data!.tenantId!);
        appRouter.push(Login(username: username));
      }
    } else {
      baseParams.uiMessage.postValue(
          UiMessage(message: response.message ?? "something_went_wrong".tr()));
    }
    baseParams.loading.postValue(false);
  }
}
