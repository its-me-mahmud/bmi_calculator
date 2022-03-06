import 'package:bmi_calculator/pages/home_page.dart';
import 'package:bmi_calculator/pages/result_page.dart';

const String home = '/';
const String result = '/result';

final routes = {
  home: (_) => HomePage(),
  result: (_) => ResultPage(),
};
