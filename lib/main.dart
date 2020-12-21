import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/bmi_provider.dart';
import 'utils/routes.dart';
import 'utils/strings.dart';
import 'utils/styles.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BmiProvider>(
      create: (_) => BmiProvider(),
      // child: DevicePreview(builder: (_) => MyApp()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
