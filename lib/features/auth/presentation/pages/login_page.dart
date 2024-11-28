import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:novelty_app/common/theming/app_colors.dart';
import 'package:novelty_app/features/auth/providers/login_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/auth_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double screenHeight;
  late LoginProvider loginProvider;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginProvider = Provider.of<LoginProvider>(context);
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
        child: SizedBox(
          height: screenHeight - 40,
          child: form(),
        ),
      ),
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
              const SizedBox(height: 16),
              subTitle(),
            ],
          ),
        ),
        Column(
          children: [
            emailInput(),
            const SizedBox(height: 16),
            passwordInput(),
          ],
        ),
        // const SizedBox(height: 28),
        Column(
          children: [
            registerOption(),
            const SizedBox(height: 28),
            loginButton(),
            const SizedBox(height: 12),
          ],
        )
      ],
    );
  }

  Widget title() {
    return const Text(
      "Let's sign you in",
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subTitle() {
    return const Text(
      "Welcome back. \nYou have been missed",
      style: TextStyle(
        fontSize: 22,
        color: AppColors.s2,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Widget registerOption() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(width: 5),
        InkWell(
          child: Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget emailInput() {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          key: const Key('loginForm_emailInput_textField'),
          controller: emailController,
          onChanged: (email) => provider.validateEmail(email),
          keyBoardType: TextInputType.emailAddress,
          hint: 'Email',
          errorText: provider.shouldValidate
              ? provider.email.validationToString(provider.email.displayError)
              : null,
        );
      },
    );
  }

  Widget passwordInput() {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return AuthInput(
          key: const Key('loginForm_passwordInput_textField'),
          controller: passwordController,
          onChanged: (password) => provider.validatePassword(password),
          obscure: true,
          hint: 'Password',
          errorText: provider.shouldValidate
              ? provider.password
                  .validationToString(provider.password.displayError)
              : null,
        );
      },
    );
  }

  Widget loginButton() {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return provider.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    backgroundColor: AppColors.gold,
                    foregroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    provider.login();
                  } else {
                    provider.validateFields();
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              );
      },
    );
  }
}



// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ElevatedButton.icon(
//       key: const Key('loginForm_googleLogin_raisedButton'),
//       label: const Text(
//         'SIGN IN WITH GOOGLE',
//         style: TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         backgroundColor: theme.colorScheme.secondary,
//       ),
//       icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
//       onPressed: () => bloc.logInWithGoogle(),
//     );
//   }
// }


