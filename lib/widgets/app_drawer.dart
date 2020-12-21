import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/routes.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final watch = context.watch<BmiProvider>();
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 32),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.home,
              color: Styles.grey,
            ),
            title: Text(
              Strings.home,
              style: Styles.primaryTextTheme.headline6.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, home);
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.calculator,
              color: Styles.grey,
            ),
            title: Text(
              Strings.result,
              style: Styles.primaryTextTheme.headline6.copyWith(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                result,
                (route) => route.settings.name == home,
              );
            },
          ),
        ],
      ),
    );
  }
}
