import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:novelty_app/common/form_inputs/password.dart';

import '../../../common/form_inputs/email.dart';

class LoginProvider extends ChangeNotifier {
  Email email;
  Password password;
  FormzSubmissionStatus status;
  bool shouldValidate;
  bool isValid;
  String errorMessage;

  LoginProvider({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.shouldValidate = false,
    this.errorMessage = "",
  });

  void validateEmail(emailInput) {
    final value = Email.dirty(emailInput);
    email = value;
    isValid = Formz.validate([email]);
    notifyListeners();
  }

  void validatePassword(passwordInput) {
    final value = Password.dirty(passwordInput);
    password = value;
    isValid = Formz.validate([password]);
    notifyListeners();
  }

  void validateFields() {
    final eml = Email.dirty(email.value);
    final pwd = Password.dirty(password.value);

    isValid = Formz.validate([eml, pwd]);
    notifyListeners();
  }

  void clear() {
    email = const Email.pure();
    password = const Password.pure();
    status = FormzSubmissionStatus.initial;
    isValid = false;
    shouldValidate = false;
    errorMessage;
  }

  Future<void> login() async {}
}
