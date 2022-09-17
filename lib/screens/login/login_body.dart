import 'package:app/helper/provider.dart';
import 'package:app/helper/validators.dart';
import 'package:app/screens/register/signup.dart';
import 'package:app/shared/items/widgets.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/fields.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:app/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: SizedBox(
        child: Column(
          children: [
            AppTextFields(
              hint: 'UserName',
              validator: (name) {
                return AppValidator.requiredField(name ?? '');
              },
            ),
            freev(),
            AppPassFields(
              validator: (pass) {
                return AppValidator.passFieldValidator(pass ?? '');
              },
            ),
            freev(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget Password?',
                  style: AppStyles.links(),
                )
              ],
            ),
            freev(v: 10),
            buttons(
                text: 'Login',
                color: AppColors.primary,
                onTap: () {
                  if (key.currentState!.validate()) {
                    //go to Home page
                  }
                }),
            buttons(
                text: 'SignUp',
                color: Colors.green,
                onTap: () {
                  navigatePush(context,
                      secondPage: ChangeNotifierProvider(
                          create: (context) {
                            return AppProvider();
                          },
                          child: const SignUp()));
                }),
          ],
        ),
      ),
    );
  }
}
