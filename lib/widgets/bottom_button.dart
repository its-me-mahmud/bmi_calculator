import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/utils.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: GestureDetector(
        onTap: onTap,
        child: FractionallySizedBox(
          heightFactor: 0.1,
          child: Container(
            alignment: Alignment.center,
            color: Styles.buttonColor,
            child: Text(title, style: Styles.primaryTextTheme.button),
          ),
        ),
      ),
    );
  }
}
