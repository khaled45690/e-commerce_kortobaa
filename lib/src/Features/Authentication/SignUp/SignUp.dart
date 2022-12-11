import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../SignIn/SignIn.dart';
import '../AuthWidgets/AuthButton.dart';
import '../AuthWidgets/AuthNavigatorButton.dart';
import '../AuthWidgets/AuthenticationLogo.dart';
import '../AuthWidgets/IntroText.dart';
import 'Control/SignUpController.dart';
import 'Widgets/SignUpTextFields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends SignUpController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthenticationLogo("signupLogo.png", context.height() / 20),
              IntroText("signUptroTitle".tr(), "signUptroDescription".tr()),
              SignUpTextFields(signUpDataError , isHidden, onChange , visibiltyChange),
              AuthButton("signUp".tr(), signup , isLoading),
              AuthNavigatorButton(
                  "haveAccount".tr(), "signIn".tr(), const SignIn()),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
