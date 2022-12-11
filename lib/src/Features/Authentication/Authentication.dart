// ignore: file_names
import 'package:flutter/material.dart';

import 'SignIn/SignIn.dart';

class Authentication extends StatelessWidget {
  final bool isSignIn;
  const Authentication(this.isSignIn , {super.key});

  @override
  Widget build(BuildContext context) {
    return isSignIn ? const SignIn() :Container();
  }
}
