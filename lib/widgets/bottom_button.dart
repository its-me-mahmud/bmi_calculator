import 'package:flutter/material.dart';

import '../utils/styles.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BottomButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: GestureDetector(
        child: FractionallySizedBox(
          heightFactor: 0.13,
          child: Container(
            alignment: Alignment.center,
            color: Styles.buttonColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(title, style: Styles.primaryTextTheme.button),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
