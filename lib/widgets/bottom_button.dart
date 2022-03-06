import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/utils.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: GestureDetector(
        onTap: onTap,
        child: FractionallySizedBox(
          heightFactor: 0.13,
          child: Container(
            alignment: Alignment.center,
            color: Styles.buttonColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(title, style: Styles.primaryTextTheme.button),
          ),
        ),
      ),
    );
  }
}
