import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:ecommerce_kortobaa/src/Features/Cart/Widgets/VerticalDashedSeperator.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Clippers.dart';
import 'CouponButtonAndTextField.dart';
import 'CouponTextAndStar.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: context.locale == const Locale('en', '')
          ? TicketClipperEN()
          : TicketClipperAR(),
      child: Container(
        color: mainBlue,
        width: context.width() - 30,
        height: context.height() / 8,
        child: Row(
          children: [
            Column(
              children: const [
                CouponTextAndStar(),
                SizedBox(
                  height: 20,
                ),
                CouponButtonAndTextField(),
              ],
            ),
            VerticalDashedSeperator(height: context.height() / 16),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey.withOpacity(0.4),
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
