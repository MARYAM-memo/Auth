import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:flutter/material.dart';

Widget headers({required String head, bool isSelect = true}) {
  return Container(
    height: isSelect == true ? 50 : 40,
    width: isSelect == true ? 120 : 110,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: isSelect == true
            ? AppColors.white
            : AppColors.white.withOpacity(.98),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          isSelect == false
              ? const BoxShadow(color: AppColors.primary)
              : BoxShadow(
                  color: AppColors.black.withOpacity(.1),
                  offset: const Offset(0, -1),
                  blurRadius: 2,
                )
        ]),
    child: Text(
      head,
      style: isSelect == true
          ? AppStyles.medium()
          : AppStyles.light(color: AppColors.black.withOpacity(.7)),
    ),
  );
}
