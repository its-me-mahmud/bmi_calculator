import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'reusable_card.dart';
import 'rounded_icon_button.dart';

class CounterButton extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterButton({
    @required this.title,
    @required this.value,
    @required this.increment,
    @required this.decrement,
  });

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
                  icon: Icons.remove,
                  onTap: decrement,
                ),
                RoundedIconButton(
                  icon: Icons.add,
                  onTap: increment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
