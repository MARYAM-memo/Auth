import 'package:app/helper/provider.dart';
import 'package:app/helper/validators.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/register/signup.dart';
import 'package:app/shared/items/widgets.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/fields.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:app/utils/auth.dart';
import 'package:app/utils/methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> key = GlobalKey();
  bool isSignIn = false;
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
            // check(),
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
            freev(),
            FutureBuilder(
              future: Authentication.fireBaseInit(),
              builder: (context, snap) {
                if (snap.hasError) {
                  return const Text('Error while initializing firebase');
                } else if (snap.connectionState == ConnectionState.done) {
                  return InkWell(
                    onTap: () async {
                      setState(() {
                        isSignIn = true;
                      });
                      User? user = await Authentication.signInWithGoogle(
                          context: context);
                      setState(() {
                        isSignIn = false;
                      });
                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHome(user: user)));
                      }
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Sign In With Google',
                          style: AppStyles.regular(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
                );
              },
            ),
            freev(),
            FutureBuilder(
              future: Authentication.fireBaseInit(),
              builder: (context, snap) {
                if (snap.hasError) {
                  return const Text('Error while initializing firebase');
                } else if (snap.connectionState == ConnectionState.done) {
                  return InkWell(
                    onTap: () async {
                      //Authentication.signInWithFacebookAuth();
                      User? user =
                          await Authentication.signInWithFacebookAuth(context);
                      if (user != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHome(user: user)));
                      }
                      /* setState(() {
                        isSignIn = true;
                      });
                      //User user =
                        //  await Authentication.signInWithFacebook(context);
                      setState(() {
                        isSignIn = false;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserHome(user: user))); */
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Sign In With Facebook',
                          style: AppStyles.regular(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.orange),
                );
              },
            ),
            freev(),
          ],
        ),
      ),
    );
  }
}

void check() {}
