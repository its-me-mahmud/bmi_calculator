import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/utils.dart';

class IconContent extends StatelessWidget {
  final bool isSelected;
  final double angle;
  final IconData icon;
  final String label;

  const IconContent({
    super.key,
    required this.isSelected,
    this.angle = 0.0,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Transform.rotate(
            angle: angle,
            child: Icon(
              icon,
              color: isSelected ? Styles.white : Styles.grey,
              size: 80,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: isSelected
              ? Styles.primaryTextTheme.headline6?.copyWith(color: Styles.white)
              : Styles.primaryTextTheme.headline6,
        ),
      ],
    );
  }
}
