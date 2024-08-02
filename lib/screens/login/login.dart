import 'package:app/layout/layout.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:flutter/material.dart';

import 'login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayOut(
      header: 'Login',
      dis: 'Hi, Iam Marim Mohamed.... Nice to meet u!',
      fields: Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.all(20),
          child: const LoginBody()),
    );
  }
}
