// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travas/Presentation/screens/checkout/checkout.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class NumberOFTourist extends StatefulWidget {
  const NumberOFTourist();

  @override
  State<NumberOFTourist> createState() => _NumberOFTouristState();
}

class _NumberOFTouristState extends State<NumberOFTourist> {
  var text = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpacing(30),
            Text(
              'Number of tourists',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            addVerticalSpacing(16),
            Text(
              'This package has only 15 slots left',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            addVerticalSpacing(90),
            Row(
              children: [
                Text(
                  'Tourists',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                addHorizontalSpacing(70),
                InkWell(
                  onTap: () {
                    setState(() {
                      text += 1;
                    });
                  },
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    color: Colors.blue,
                  ),
                ),
                addHorizontalSpacing(50),
                Text(
                  text.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                addHorizontalSpacing(50),
                InkWell(
                  onTap: () {
                    setState(() {
                      var x = text - 1;
                      if (x < 0) {
                        text = 0;
                      }
                      text -= 1;
                    });
                  },
                  child: Icon(
                    Icons.remove_circle_outline_sharp,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            addVerticalSpacing(100),
            Text(
              'Total',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600),
            ),
            addVerticalSpacing(15),
            Divider(
              height: 3,
              color: Colors.grey,
            ),
            addVerticalSpacing(15),
            Text(
              '#1000000',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            addVerticalSpacing(140),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: ReusableButton(const Text('Proceed'), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
