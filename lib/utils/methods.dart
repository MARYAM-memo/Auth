import 'package:flutter/material.dart';

void navigatePush(
  BuildContext context, {
  required Widget secondPage,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return secondPage;
  }));
}

void navigatePop(
  BuildContext context, ) {
  Navigator.pop(context);
}
