import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:bmi_calculator/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          return Padding(
            padding: EdgeInsets.all(height / 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: ReusableCard(
                            color: watch.isMaleSelected
                                ? Styles.activeColor
                                : Styles.inactiveColor,
                            child: IconContent(
                              isSelected: watch.isMaleSelected,
                              icon: FontAwesomeIcons.mars,
                              label: Strings.male,
                            ),
                          ),
                          onTap: () {
                            watch.isMaleSelected = true;
                            watch.isFemaleSelected = false;
                          },
                        ),
                      ),
                      SizedBox(width: width / 60),
                      Expanded(
                        child: GestureDetector(
                          child: ReusableCard(
                            color: watch.isFemaleSelected
                                ? Styles.activeColor
                                : Styles.inactiveColor,
                            child: IconContent(
                              isSelected: watch.isFemaleSelected,
                              angle: 95,
                              icon: FontAwesomeIcons.venus,
                              label: Strings.female,
                            ),
                          ),
                          onTap: () {
                            watch.isFemaleSelected = true;
                            watch.isMaleSelected = false;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 24),
                Expanded(
                  child: ReusableCard(
                    color: Styles.secondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height / 44),
                        Text(
                          Strings.height,
                          style: Styles.primaryTextTheme.titleLarge,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${watch.height.round()}',
                                style: Styles.primaryTextTheme.displayLarge,
                              ),
                              Text(
                                Strings.cm,
                                style: Styles.primaryTextTheme.titleLarge
                                    ?.copyWith(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          min: 120,
                          max: 220,
                          value: watch.height.toDouble(),
                          onChanged: (value) {
                            watch.height = value.round();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 24),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: CounterButton(
                          title: Strings.weight,
                          value: watch.weight,
                          increment: watch.incrementWeight,
                          decrement: watch.decrementWeight,
                        ),
                      ),
                      SizedBox(width: width / 60),
                      Expanded(
                        child: CounterButton(
                          title: Strings.age,
                          value: watch.age,
                          increment: watch.incrementAge,
                          decrement: watch.decrementAge,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomButton(
        title: Strings.calculateBmi,
        onTap: () {
          context.read<BmiProvider>().calculateBmi();
          Navigator.pushNamed(context, result);
        },
      ),
    );
  }
}
