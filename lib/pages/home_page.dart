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
      body: Padding(
        padding: const EdgeInsets.all(24),
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
                  const SizedBox(width: 4),
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
            const SizedBox(height: 24),
            Expanded(
              child: ReusableCard(
                color: Styles.secondaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.height,
                      style: Styles.primaryTextTheme.headline6,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            '${watch.height.round()}',
                            style: Styles.primaryTextTheme.headline1,
                          ),
                          Text(
                            Strings.cm,
                            style: Styles.primaryTextTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
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
            const SizedBox(height: 24),
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
                  const SizedBox(width: 4),
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
