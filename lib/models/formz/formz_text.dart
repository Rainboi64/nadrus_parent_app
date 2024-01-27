import 'package:formz/formz.dart';

enum InputError { empty, invalid }

class FormzText extends FormzInput<String, InputError> {
  const FormzText.pure([String value = '']) : super.pure(value);
  const FormzText.dirty([String value = '']) : super.dirty(value);

  @override
  InputError? validator(String value) {
    /// validate textField value.
    if (value.isEmpty) {
      return InputError.empty;
    }
    return null;
  }
}

extension Explanation on InputError {
  String? get message {
    switch (this) {
      // return your message depending on InputError.type
      default:
        return null;
    }
  }
}
