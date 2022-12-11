import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Style.dart';

class AuthNavigatorButton extends StatelessWidget {
  final String firstPartText, secondPartText;
  final Widget destination;
  const AuthNavigatorButton(
      this.firstPartText, this.secondPartText, this.destination,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: InkWell(
          onTap: () => navigator(context),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(firstPartText, style: textFieldUpperTextStyle),
            const SizedBox(
              width: 10,
            ),
            Text(secondPartText, style: authsecondPartTextStyle),
          ])),
    );
  }

  navigator(BuildContext context) {
    Navigator.of(context).pop();
    context.navigateTo(destination);
  }
}
