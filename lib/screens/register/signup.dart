import 'package:app/layout/layout.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:app/utils/methods.dart';
import 'package:flutter/material.dart';
import 'signup_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayOut(
      leading: IconButton(
          onPressed: () {
            navigatePop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary,
            size: 20,
          )),
      header: 'SignUp',
      dis:
          'Hi, Iam Marim Mohamed.... Nice to meet u! then how are u? Um fine thanks, so its okay',
      fields: const SignUpBody(),
    );
  }
}
