import 'package:app/shared/resources/colors.dart';
import 'package:app/shared/resources/styles.dart';
import 'package:flutter/material.dart';

class AppPopUpMenu extends StatelessWidget {
  const AppPopUpMenu({super.key, required this.list, this.onSelect, required this.txt});
  final List list;
  final String txt;
  final Function(Object)? onSelect;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.second,
      onSelected: onSelect,
      itemBuilder: ((context) {
        return list
            .map((e) => PopupMenuItem(
                value: e['index'],
                child: Center(
                  child: Text(
                    e[txt] as String,
                    style: AppStyles.light(),
                  ),
                )))
            .toList();
      }),
      child: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.primary,
        size: 20,
      ),
    );
  }
}
