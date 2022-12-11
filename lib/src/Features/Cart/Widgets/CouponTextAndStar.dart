import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Style.dart';

class CouponTextAndStar extends StatelessWidget {
  const CouponTextAndStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.star,
            color: Colors.grey.withOpacity(0.4),
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "doYouHaveCoupon".tr(),
            style: couponTextStyle,
          ),
          SizedBox(
            width: context.locale == const Locale('en', '') ? context.width() / 15 : context.width() / 7,
          ),
        ],
      ),
    );
  }
}
