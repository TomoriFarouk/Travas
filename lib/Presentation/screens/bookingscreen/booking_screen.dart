import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travas/Presentation/widget/constants.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Bookings',
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Center(
          child: Column(
        children: [
          addVerticalSpacing(100),
          Image.asset('assets/Booking.png'),
          addVerticalSpacing(30),
          Text(
            'Your bookings would appear here',
            style: TextStyle(color: Color(0xff575656), fontSize: 14.sp),
          ),
          addVerticalSpacing(20),
          Text(
            'An unforgettable experience awaits you at Travas',
            style: TextStyle(color: Color(0xff575656), fontSize: 14.sp),
          )
        ],
      )),
    );
  }
}
