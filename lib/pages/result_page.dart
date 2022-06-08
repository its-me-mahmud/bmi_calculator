import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:bmi_calculator/widgets/widgets.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BmiProvider>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.bars),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        leadingWidth: 68,
        title: const Text(Strings.appTitle),
      ),
      drawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          return Padding(
            padding: EdgeInsets.all(height / 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.yourResult,
                  style: Styles.primaryTextTheme.bodyText1?.copyWith(
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: height / 24),
                Expanded(
                  child: ReusableCard(
                    padding: EdgeInsets.all(height / 16),
                    color: Styles.inactiveColor,
                    child: Column(
                      children: [
                        Text(
                          watch.getResult(),
                          style: Styles.primaryTextTheme.headline6?.copyWith(
                            letterSpacing: 2,
                            color: watch.getResultColor(),
                          ),
                        ),
                        Text(
                          context
                              .select((BmiProvider value) => value.bmi)
                              .toStringAsFixed(1),
                          style: Styles.primaryTextTheme.headline5?.copyWith(
                            letterSpacing: 8,
                          ),
                        ),
                        SizedBox(height: height / 16),
                        Text(
                          watch.getRange(),
                          style: Styles.primaryTextTheme.headline6?.copyWith(
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          watch.getRangeValue(),
                          style: Styles.primaryTextTheme.headline6?.copyWith(
                            letterSpacing: 2,
                            color: Styles.white,
                          ),
                        ),
                        SizedBox(height: height / 16),
                        Text(
                          watch.getDescription(),
                          textAlign: TextAlign.center,
                          style: Styles.primaryTextTheme.headline6?.copyWith(
                            letterSpacing: 2,
                            color: Styles.white,
                          ),
                        ),
                        SizedBox(height: height / 16),
                        Expanded(
                          child: TextButton(
                            onPressed: () =>
                                context.read<BmiProvider>().saveBmi(),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => Styles.getColor(states),
                              ),
                            ).merge(
                              TextButton.styleFrom(
                                minimumSize: const Size(double.infinity, 60),
                                splashFactory: NoSplash.splashFactory,
                              ),
                            ),
                            child: Text(
                              Strings.saveResult,
                              style: Styles.primaryTextTheme.button?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomButton(
        title: Strings.recalculateBmi,
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
