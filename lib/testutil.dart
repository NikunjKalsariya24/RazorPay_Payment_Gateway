import 'package:flutter/material.dart';
import 'package:paymentintegration/screen_utils.dart';

class TestUtil extends StatelessWidget {
  const TestUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: true,elevation:  0,),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [


        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeUtils.verticalBlockSize*3),
          child: Text("Recommended Diet",style: TextStyle(fontSize: SizeUtils.fSize_24()),),
        ),

        Text("Breakfast",style: TextStyle(fontSize: SizeUtils.fSize_20()),)
      ]),
    );
  }
}
