import 'package:beck_booking/core/common/color.dart';
import 'package:flutter/material.dart';

class Height {
  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double fitHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
  }
}

ButtonStyle btnStyle() {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
    backgroundColor: MaterialStateProperty.all<Color>(blueColor),
  );
}
