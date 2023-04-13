import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentintegration/routes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'screen_utils.dart';

class RazorPay extends StatefulWidget {
  const RazorPay({Key? key}) : super(key: key);

  @override
  State<RazorPay> createState() => _RazorPayState();
}

class _RazorPayState extends State<RazorPay> {
//  model m=model();
  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);

  }

  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {

        Get.back();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(height: SizeUtils.verticalBlockSize*10),
          GestureDetector(onTap: () {



            var options = {
              'key': 'rzp_test_BLZkOYqO4kd9t1',
              'amount': 100,
              'name': 'Samsung Guru 1200',
              'description': 'Mobile Phone',
              'retry': {'enabled': true, 'max_count': 10},
              'send_sms_hash': true,
              'prefill': {'contact': '9925515832', 'email': 'nikunjkalsariya9099@gmail.com'},
              'external': {
                'wallets': ['paytm']
              }
            };
            try {
              razorpay.open(options);
            } catch (e) {
              debugPrint('Error: ${e.toString()}');
            }

         //   razorpay.open(options);


          },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize*3,horizontal: SizeUtils.horizontalBlockSize*6),color: Colors.orangeAccent,
              child: Text("Payment Start Razorpay ", style: TextStyle(fontSize: SizeUtils.fSize_16()),

              ),
            ),
          ),
            SizedBox(height:SizeUtils.verticalBlockSize*3 ,),




          GestureDetector(onTap: () {


                Get.toNamed(Routes.testUtil);

          },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize*3,horizontal: SizeUtils.horizontalBlockSize*6),color: Colors.blue,
              child: Text("Payment Start PayPal ", style: TextStyle(fontSize: SizeUtils.fSize_16()),

              ),
            ),
          ),

        ],
      ),
    );

  }

  // void handlePaymentErrorResponse(PaymentFailureResponse response){
  //   /*
  //   * PaymentFailureResponse contains three values:
  //   * 1. Error Code
  //   * 2. Error Description
  //   * 3. Metadata
  //   * */
  //   showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  // }
  //
  // void handlePaymentSuccessResponse(PaymentSuccessResponse response){
  //   /*
  //   * Payment Success Response contains three values:
  //   * 1. Order ID
  //   * 2. Payment ID
  //   * 3. Signature
  //   * */
  //   showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  // }
  //
  // void handleExternalWalletSelected(ExternalWalletResponse response){
  //   showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  // }
  //
  // void showAlertDialog(BuildContext context, String title, String message){
  //   // set up the buttons
  //   Widget continueButton = ElevatedButton(
  //     child: const Text("Continue"),
  //     onPressed:  () {
  //
  //       Get.back();
  //     },
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text(title),
  //     content: Text(message),
  //     actions: [
  //       continueButton,
  //     ],
  //   );
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}

