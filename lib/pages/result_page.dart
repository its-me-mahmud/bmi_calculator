import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/bmi_provider.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_button.dart';
import '../widgets/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BmiProvider>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.bars),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        leadingWidth: 68,
        title: const Text(Strings.appTitle),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.yourResult,
              style: Styles.primaryTextTheme.bodyText1.copyWith(
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ReusableCard(
                padding: const EdgeInsets.all(38),
                color: Styles.inactiveColor,
                child: Column(
                  children: [
                    Text(
                      '${watch.getResult()}',
                      style: Styles.primaryTextTheme.headline6.copyWith(
                        letterSpacing: 2,
                        color: watch.getResultColor(),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context
                          .select((BmiProvider value) => value.bmi)
                          .toStringAsFixed(1),
                      style: Styles.primaryTextTheme.headline5,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      '${watch.getRange()}',
                      style: Styles.primaryTextTheme.headline6.copyWith(
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${watch.getRangeValue()}',
                      style: Styles.primaryTextTheme.headline6.copyWith(
                        letterSpacing: 2,
                        color: Styles.white,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      '${watch.getDescription()}',
                      textAlign: TextAlign.center,
                      style: Styles.primaryTextTheme.headline6.copyWith(
                        letterSpacing: 2,
                        color: Styles.white,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: FlatButton(
                        color: Styles.activeColor,
                        splashColor: Styles.buttonColor,
                        highlightColor: Styles.buttonColor,
                        minWidth: double.infinity,
                        height: 60,
                        child: Text(
                          Strings.saveResult,
                          style: Styles.primaryTextTheme.button.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onPressed: () {
                          context.read<BmiProvider>().saveBmi();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        title: Strings.recalculateBmi,
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
