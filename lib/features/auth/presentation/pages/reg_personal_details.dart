import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:novelty_app/features/auth/providers/registration_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/theming/app_colors.dart';
import '../widgets/auth_input.dart';

class RegistrationPersonalInfoPage extends StatefulWidget {
  const RegistrationPersonalInfoPage({super.key});

  @override
  State<RegistrationPersonalInfoPage> createState() =>
      _RegistrationPersonalInfoPageState();
}

class _RegistrationPersonalInfoPageState
    extends State<RegistrationPersonalInfoPage> {
  late RegistrationProvider registrationProvider;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registrationProvider = Provider.of<RegistrationProvider>(context);
    registrationProvider.shouldValidate = mounted;
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    registrationProvider.shouldValidate = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      builder: (BuildContext context, value, Widget? child) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(registrationProvider.errorMessage.value),
            ),
          );
        return child!;
      },
      valueListenable: registrationProvider.errorMessage,
      child: form(),
    );
  }

  Widget form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              title(),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitle(),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 20),
            firstNameInput(),
            const SizedBox(height: 16),
            lastNameInput(),
            const SizedBox(height: 16),
            ageInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            registrationButton(),
            const SizedBox(height: 12),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Let's begin.",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle() {
    return const Text(
      "Enter your details",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white60,
      ),
    );
  }

  Widget firstNameInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: firstNameController,
          onChanged: (firstname) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'First Name',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget lastNameInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: lastNameController,
          onChanged: (lastName) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Last Name',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget ageInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: ageController,
          onChanged: (age) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Age',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget registrationButton() {
    return Consumer<RegistrationProvider>(
      builder:
          (BuildContext context, RegistrationProvider state, Widget? child) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('RegistrationForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (state.age.isValid &&
                      state.firstName.isValid &&
                      state.lastName.isValid) {
                    state.page = 1;
                  } else {
                    //  TODO error snackbar
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              );
      },
    );
  }
}
