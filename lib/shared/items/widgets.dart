import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:flutter/material.dart';

Icon icons(
  IconData icon, {
  Color color = AppColors.primary,
}) {
  return Icon(
    icon,
    color: color,
    size: 22,
  );
}

SizedBox freev({double v = 20}) {
  return SizedBox(
    height: v,
  );
}

SizedBox freeh({double h = 20}) {
  return SizedBox(
    width: h,
  );
}

Container line(context) {
  return Container(
    height: .7,
    width: MediaQuery.of(context).size.width / 2 - 40 - 10,
    color: AppColors.black,
  );
}

Widget box(String img) {
  return Container(
    height: 52,
    alignment: Alignment.center,
    width: 52,
    decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(.2),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: AppColors.black.withOpacity(.2),
      ),
    ),
    child: Image.asset(
      img,
      height: 35,
      width: 35,
    ),
  );
}

Widget buttons(
    {required String text, required Color color, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 280,
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.15),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: AppStyles.regular(color: AppColors.white),
      ),
    ),
  );
}
