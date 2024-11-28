import 'package:flutter/material.dart';
import 'package:novelty_app/features/auth/presentation/pages/reg_experience_page.dart';
import 'package:novelty_app/features/auth/presentation/pages/reg_personal_details.dart';
import 'package:novelty_app/features/auth/providers/registration_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/theming/app_colors.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late RegistrationProvider registrationProvider;

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
    registrationProvider.shouldValidate = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScaffoldMessenger.of(context)
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(
    //       SnackBar(
    //         content: Text(state.errorMessage ?? 'Authentication Failure'),
    //       ),
    //     );
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
        child: body(),
      ),
    );
  }

  Widget body() {
    return Consumer<RegistrationProvider>(
      builder: (context, provider, child) {
        return IndexedStack(
          index: provider.page,
          children: const [
            RegistrationPersonalInfoPage(),
            RegistrationExperiencePage(),
          ],
        );
      },
    );
  }
}
