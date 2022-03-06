import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    this.padding = const EdgeInsets.all(4.0),
    required this.color,
    required this.child,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
