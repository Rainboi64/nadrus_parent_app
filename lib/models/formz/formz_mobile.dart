import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

enum MobileValidationError { invalid, empty }

class FormzMobile extends FormzInput<String, MobileValidationError> {
  const FormzMobile.pure() : super.pure('');
  const FormzMobile.dirty([String value = '']) : super.dirty(value);

  bool isValidSyrianMobileNumber(String number) {
    RegExp regex = RegExp(r"^(93|94|95|96|97|98|99)[0-9]{7}$");
    return regex.hasMatch(number);
  }

  @override
  MobileValidationError? validator(String value) {
    if (value.isEmpty) {
      return MobileValidationError.empty;
    }
    if (!isValidSyrianMobileNumber(value)) {
      return MobileValidationError.invalid;
    }
    return null;
  }
}

extension Explanation on MobileValidationError {
  String? get message {
    switch (this) {
      case MobileValidationError.invalid:
        return 'mobile_number_invalid'.tr();
      default:
        return null;
    }
  }
}
