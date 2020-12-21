import 'package:flutter/material.dart';

import '../utils/styles.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const RoundedIconButton({
    @required this.icon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Styles.activeColor,
      splashColor: Styles.buttonColor,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(height: 60, width: 60),
      child: Icon(icon, color: Styles.white),
      onPressed: onTap,
    );
  }
}
