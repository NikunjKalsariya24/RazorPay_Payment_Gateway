import 'package:get/get.dart';
import 'package:paymentintegration/testutil.dart';

import 'razorpay.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;

  static const String razorpay = '/RazorPay';
  static const String testUtil = '/TestUtil';
  static List<GetPage<dynamic>> pages = [
  GetPage<dynamic>(
  name: razorpay,
  page: () => RazorPay(),
  transition: defaultTransition,
  ),
    GetPage<dynamic>(
  name: testUtil,
  page: () => TestUtil(),
  transition: defaultTransition,
  ),
  ];
}