import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class PaymentForRazorpay extends StatelessWidget {
  const PaymentForRazorpay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.razorpay,
      getPages: Routes.pages,
    );
  }
}
class AppBinding extends Bindings {
  @override
  void dependencies() {

  }
}

