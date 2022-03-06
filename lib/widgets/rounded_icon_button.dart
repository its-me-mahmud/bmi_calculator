import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/utils.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Styles.activeColor,
      splashColor: Styles.buttonColor,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(height: 60, width: 60),
      child: Icon(icon, color: Styles.white),
    );
  }
}
