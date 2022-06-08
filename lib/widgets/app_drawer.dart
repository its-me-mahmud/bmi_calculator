import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/utils/utils.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 32),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, home),
            leading: const Icon(
              FontAwesomeIcons.house,
              color: Styles.grey,
            ),
            title: Text(
              Strings.home,
              style: Styles.primaryTextTheme.headline6?.copyWith(fontSize: 16),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                result,
                (route) => route.settings.name == home,
              );
            },
            leading: const Icon(
              FontAwesomeIcons.calculator,
              color: Styles.grey,
            ),
            title: Text(
              Strings.result,
              style: Styles.primaryTextTheme.headline6?.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
