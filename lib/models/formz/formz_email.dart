import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class FormzEmail extends FormzInput<String, EmailValidationError> {
  const FormzEmail.pure([String value = '']) : super.pure(value);
  const FormzEmail.dirty([String value = '']) : super.dirty(value);

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!isEmailValid(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

extension Explanation on EmailValidationError {
  String? get message {
    switch (this) {
      case EmailValidationError.invalid:
        return 'Email_number_invalid'.tr();
      default:
        return null;
    }
  }
}
