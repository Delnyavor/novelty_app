import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:novelty_app/features/auth/providers/registration_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/theming/app_colors.dart';
import '../widgets/auth_input.dart';

class RegistrationExperiencePage extends StatefulWidget {
  const RegistrationExperiencePage({super.key});

  @override
  State<RegistrationExperiencePage> createState() =>
      _RegistrationExperiencePageState();
}

class _RegistrationExperiencePageState
    extends State<RegistrationExperiencePage> {
  late RegistrationProvider registrationProvider;
  final TextEditingController lifestyleController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController jobsController = TextEditingController();
  final TextEditingController educationLevel = TextEditingController();

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
    lifestyleController.dispose();
    experienceController.dispose();
    jobsController.dispose();
    educationLevel.dispose();
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Transform.translate(
              offset: const Offset(-15, 0),
              child: Transform.flip(
                flipY: true,
                child: IconButton(
                  icon: const Icon(
                    Icons.keyboard_return,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    registrationProvider.page = registrationProvider.page + 1;
                  },
                ),
              ),
            ),
            title(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            subTitle("Experience"),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 20),
            lifestyleInput(),
            const SizedBox(height: 16),
            experienceInput(),
            const SizedBox(height: 60),
            subTitle("Professional"),
            const SizedBox(height: 12),
            const Divider(
              color: AppColors.s2,
              thickness: 0.1,
              height: 1,
            ),
            const SizedBox(height: 16),
            jobsInput(),
            const SizedBox(height: 16),
            educationLevelInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            const SizedBox(height: 60),
            registrationButton(),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Tell us about yourself.",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.white60,
      ),
    );
  }

  Widget lifestyleInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: lifestyleController,
          onChanged: (lifestyle) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Lifestyle',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget experienceInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: experienceController,
          onChanged: (experience) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Experience',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget jobsInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: jobsController,
          onChanged: (jobs) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Jobs',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget educationLevelInput() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          controller: educationLevel,
          onChanged: (educationLevel) => () {
            // TODO: implement this
          },
          // keyBoardType: TextInputType.,
          hint: 'Education Level',
          // errorText: provider.shouldValidate
          //     ? provider.lifestyle.validationToString(provider.lifestyle.displayError)
          //     : null,
        );
      },
    );
  }

  Widget registrationButton() {
    return Consumer<RegistrationProvider>(
      builder: (context, state, child) {
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
                  // if (state.jobs.isValid &&
                  //     state.lifestyle.isValid &&
                  //     state.experience.isValid) {
                  //   FocusScope.of(context).unfocus();
                  //   bloc.add(const PageChanged(increment: 1));
                  // } else {
                  //   //  TODO error snackbar
                  // }
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
