import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import '../SignUp/SignUp.dart';
import '../AuthWidgets/AuthButton.dart';
import '../AuthWidgets/AuthNavigatorButton.dart';
import '../AuthWidgets/AuthenticationLogo.dart';
import '../AuthWidgets/IntroText.dart';
import 'Control/SignInControl.dart';
import 'Widgets/SignInTextFields.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends SignInControl {
  @override
  Widget build(BuildContext context) {
    // context.setLocale(Locale('ar', ''));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthenticationLogo("signinLogo.png", context.height() / 10),
              IntroText("signIntroTitle".tr(), "signIntroDescription".tr()),
              SignInTextField(
                  signInDataError, isHidden, onChange, visibiltyChange),
              AuthButton("signIn".tr(), signIn, isLoading),
              AuthNavigatorButton(
                  "dontHaveAccount".tr(), "signUp".tr(), const SignUp()),
            ],
          ),
        ),
      ),
    );
  }
}
