import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/utils.dart';
import 'package:bmi_calculator/widgets/widgets.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.increment,
    required this.decrement,
    required this.title,
    required this.value,
  });

  final void Function() increment;
  final void Function() decrement;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      color: Styles.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.primaryTextTheme.headline6,
          ),
          Text(
            '$value',
            style: Styles.primaryTextTheme.headline1,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedIconButton(
                  onPressed: decrement,
                  icon: Icons.remove,
                ),
                RoundedIconButton(
                  onPressed: increment,
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
