import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/utils/utils.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BmiProvider>(
      create: (_) => BmiProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: Styles.primaryTheme,
      routes: routes,
    );
  }
}
