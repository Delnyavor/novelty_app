import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
import 'package:novelty_app/common/form_inputs/password.dart';
import 'package:novelty_app/common/form_inputs/text.dart' as txt;

import '../../../common/form_inputs/email.dart';

class RegistrationProvider extends ChangeNotifier {
  Email email;
  Password password;
  int page;
  FormzSubmissionStatus status;
  txt.TextInput age;
  txt.TextInput firstName;
  txt.TextInput lastName;
  txt.TextInput lifeStyle;
  txt.TextInput education;
  txt.TextInput experience;
  txt.TextInput jobs;
  List<String> jobsList;
  bool shouldValidate;
  bool isValid;
  ValueNotifier<String> errorMessage = ValueNotifier("");

  RegistrationProvider({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.page = 0,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.jobsList = const [],
    this.age = const txt.TextInput.pure(),
    this.firstName = const txt.TextInput.pure(),
    this.lastName = const txt.TextInput.pure(),
    this.jobs = const txt.TextInput.pure(),
    this.education = const txt.TextInput.pure(),
    this.experience = const txt.TextInput.pure(),
    this.lifeStyle = const txt.TextInput.pure(),
    this.shouldValidate = false,
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

  void validateAge(ageInput) {
    final value = txt.TextInput.dirty(ageInput);
    age = value;
    isValid = Formz.validate([age]);
    notifyListeners();
  }

  void validatefirstName(firstNameInput) {
    final value = txt.TextInput.dirty(firstNameInput);
    firstName = value;
    isValid = Formz.validate([firstName]);
    notifyListeners();
  }

  void validateLastName(lastNameInput) {
    final value = txt.TextInput.dirty(lastNameInput);
    lastName = value;
    isValid = Formz.validate([lastName]);
    notifyListeners();
  }

  void validateJobs(jobsInput) {
    final value = txt.TextInput.dirty(jobsInput);
    jobs = value;
    isValid = Formz.validate([jobs]);
    notifyListeners();
  }

  void validateExperience(experienceInput) {
    final value = txt.TextInput.dirty(experienceInput);
    experience = value;
    isValid = Formz.validate([experience]);
    notifyListeners();
  }

  void validateEducation(educationInput) {
    final value = txt.TextInput.dirty(educationInput);
    education = value;
    isValid = Formz.validate([education]);
    notifyListeners();
  }

  void validateLifeStyle(lifeStyleInput) {
    final value = txt.TextInput.dirty(lifeStyleInput);
    lifeStyle = value;
    isValid = Formz.validate([lifeStyle]);
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
}
