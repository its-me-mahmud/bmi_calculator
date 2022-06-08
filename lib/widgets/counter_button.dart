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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return ReusableCard(
          padding: EdgeInsets.symmetric(
            horizontal: width / 16,
            vertical: height / 24,
          ),
          color: Styles.secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height / 16),
              Text(
                title,
                style: Styles.primaryTextTheme.headline6,
              ),
              Text(
                '$value',
                style: Styles.primaryTextTheme.headline1,
              ),
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
              SizedBox(height: height / 44),
            ],
          ),
        );
      },
    );
  }
}
