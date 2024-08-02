import 'package:app/helper/provider.dart';
import 'package:app/helper/validators.dart';
import 'package:app/screens/login/login.dart';
import 'package:app/shared/items/popup.dart';
import 'package:app/shared/items/widgets.dart';
import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/fields.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/expanded.dart';
import 'package:app/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detais extends StatefulWidget {
  const Detais({super.key});

  @override
  State<Detais> createState() => _DetaisState();
}

class _DetaisState extends State<Detais> {
  bool check = false;
  bool showCustom = false;
  String countryCode = '+20';
  dynamic countryIndex;
  String countrySt = 'Country';
  String area = 'Area';
  bool showLink = false;
  bool showTermsValidate = false;

  String link = '';
  TextEditingController linkController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AppProvider>(context);
    List areaList =
        countryIndex == null ? [] : country[countryIndex]['locations'] as List;
    return Form(
      key: key,
      child: Column(
        children: [
          //fields
          AppTextFields(
            hint: 'Full Name',
            prefixIcon: const Icon(
              Icons.person,
              color: AppColors.primary,
              size: 20,
            ),
            validator: (name) {
              return AppValidator.requiredField(name ?? '');
            },
            onChanged: (char) {
              key.currentState!.validate();
            },
          ),
          freev(),
          AppTextFields(
            hint: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.mail,
              size: 20,
              color: AppColors.primary,
            ),
            onChanged: (char) {
              key.currentState!.validate();
            },
            validator: (email) {
              return AppValidator.requiredField(email ?? '');
            },
          ),
          freev(),
          AppPassFields(
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.primary,
              size: 20,
            ),
            validator: (pass) {
              return AppValidator.passFieldValidator(pass ?? '');
            },
            onChanged: (char) {
              key.currentState!.validate();
            },
          ),
          freev(),
          //custom fields
          prov.current == 0
              ? ExpandedSection(
                  expand: showCustom,
                  child: SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: AppTextFields(
                              readOnly: true,
                              hint: countryCode,
                              suffixIcon: AppPopUpMenu(
                                  list: countryCodes,
                                  txt: 'code',
                                  onSelect: ((value) {
                                    setState(() {
                                      countryCode = countryCodes[value as int]
                                          ['code'] as String;
                                    });
                                  })),
                            )),
                            freeh(h: 15),
                            const Expanded(
                                flex: 2,
                                child: AppTextFields(
                                  hint: 'Phone Number',
                                  keyboardType: TextInputType.number,
                                )),
                          ],
                        ),
                        freev(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: AppTextFields(
                              readOnly: true,
                              hint: countrySt,
                              suffixIcon: AppPopUpMenu(
                                list: country,
                                txt: 'code',
                                onSelect: (val) {
                                  setState(() {
                                    countrySt =
                                        country[val as int]['code'] as String;
                                    countryIndex = val;
                                  });
                                },
                              ),
                            )),
                            freeh(),
                            Expanded(
                                child: AppTextFields(
                              hint: area,
                              readOnly: true,
                              suffixIcon: AppPopUpMenu(
                                list: countryIndex == null
                                    ? []
                                    : country[countryIndex]['locations']
                                        as List,
                                txt: 'loc',
                                onSelect: (val) {
                                  setState(() {
                                    area =
                                        areaList[val as int]['loc'] as String;
                                  });
                                },
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ))
              : prov.current == 1
                  ? ExpandedSection(
                      expand: showCustom,
                      child: SizedBox(
                        child: Column(
                          children: [
                            AppTextFields(
                              controller: linkController,
                              hint: 'add link',
                              keyboardType: TextInputType.url,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (linkController.text.isNotEmpty) {
                                        showLink = true;
                                        link = linkController.text;
                                        linkController.text = '';
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: AppColors.primary,
                                    size: 20,
                                  )),
                            ),
                            freev(),
                            ExpandedSection(
                              expand: showLink,
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                color: AppColors.second,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      link,
                                      style: AppStyles.links(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    freeh(h: 8),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            link = '';
                                            showLink = false;
                                          });
                                        },
                                        icon: Text(
                                          'X',
                                          style: AppStyles.regular(),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),

          freev(),

          //terms&conditions
          Row(
            children: [
              Checkbox(
                  value: check,
                  checkColor: AppColors.white,
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      if (check == false || showTermsValidate == false) {
                        check = true;
                        showTermsValidate = true;
                      }
                    });
                  }),
              freeh(h: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'I agree ',
                          style: AppStyles.light(),
                          children: [
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: AppStyles.light(color: AppColors.primary))
                      ])),
                  showTermsValidate == true
                      ? Text(
                          'you must agree!',
                          style: AppStyles.light(color: Colors.red),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),

          //button
          buttons(
              text: 'Register',
              color: AppColors.primary,
              onTap: () {
                if (key.currentState!.validate()) {
                  if (check == true) {
                    //go to Home Page
                    navigatePush(context, secondPage: const Login());
                  } else {
                    setState(() {
                      showTermsValidate = true;
                    });
                  }
                }
              }),

          //custom button
          showCustom == true
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      showCustom = true;
                    });
                  },
                  child: Column(
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                      ),
                      Text(
                        'custom',
                        style: AppStyles.light(),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
