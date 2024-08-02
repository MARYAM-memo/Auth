import 'package:app/helper/provider.dart';
import 'package:app/screens/register/designs.dart';
import 'package:app/screens/register/details.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  List<String> heads = [
    'User',
    'Buyer',
    'User/Buyer',
  ];

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppProvider>(context);
    return SizedBox(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < heads.length; i++)
                GestureDetector(
                    onTap: () {
                      prov.changeCurrent(i);
                    },
                    child: choose(heads[i], i)),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: const Detais()),
        ],
      ),
    );
  }

  Widget choose(String head, int index) {
    var prov = Provider.of<AppProvider>(context);
    if (prov.current == index) {
      return headers(head: head);
    } else {
      return headers(head: head, isSelect: false);
    }
  }
}
