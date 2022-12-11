import 'package:flutter/cupertino.dart';

import '../../../../Utilities/Style.dart';

class IntroText extends StatelessWidget {
  final String introTitle, introDescription;
  const IntroText(this.introTitle, this.introDescription, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          introTitle,
          style: authTitleStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          introDescription,
          style: authDescriptionStyle,
          
        ),
          const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
