import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travas/Presentation/screens/home/home_screen.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class BookingSlip extends StatelessWidget {
  const BookingSlip();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 38.h,
                child: Padding(
                  padding: const EdgeInsets.only(right: 80.0),
                  child: Text(
                    'Here is your booking for your tour package, please ensure to save',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              addVerticalSpacing(30),
              Padding(
                padding: const EdgeInsets.only(left: 200, right: 25),
                child: ReusableButton(
                    Row(
                      children: [
                        Text('Save'),
                        addHorizontalSpacing(10),
                        Icon(Icons.arrow_downward)
                      ],
                    ), () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => Checkout()));
                }),
              ),
              addVerticalSpacing(30),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5,
                        color: Colors.black,
                        style: BorderStyle.solid)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 33.h,
                          width: 96.w,
                          child: Image.asset('assets/Travas Logo.jpg'),
                        ),
                        addVerticalSpacing(70),
                        Center(
                          child: Text(
                            'Booking Slip',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        addVerticalSpacing(20),
                        info(title: 'Name:', sub: 'Adewale Theophilus'),
                        info(title: 'Number of tourist:', sub: 'Two(2)'),
                        info(title: 'Tour title:', sub: 'The Obudu Xperience'),
                        info(title: 'Price:', sub: '#15,000'),
                        info(title: 'Start date:', sub: '12th September 2022'),
                        info(title: 'Start time:', sub: '8:00 AM'),
                        info(
                            title: 'meeting point:',
                            sub: 'Wuse park, FCT, Abuja'),
                        info(title: 'Tour operator:', sub: 'Naija adventurers'),
                        info(title: 'Tour guide:', sub: 'Sunday Omotayo'),
                        info(title: 'Tour guide:', sub: 'Sunday Omotayo'),
                        info(
                            title: 'Tour operator’s contact details:',
                            sub: '0908 765 6576'),
                        addVerticalSpacing(7),
                        Text(
                          'info@naijaadventurers.com',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                        info(title: 'Date:', sub: '16-11-2022'),
                      ],
                    ),
                  ),
                ),
              ),
              addVerticalSpacing(100),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: ReusableButton(
                    Row(
                      children: [
                        addHorizontalSpacing(80),
                        Text('Save'),
                        addHorizontalSpacing(10),
                        Icon(Icons.arrow_downward)
                      ],
                    ), () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => Checkout()));
                }),
              ),
              addVerticalSpacing(50),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                },
                child: Row(
                  children: [
                    addHorizontalSpacing(110),
                    Icon(
                      Icons.keyboard_double_arrow_left,
                      color: Colors.blue,
                    ),
                    addHorizontalSpacing(10),
                    Text(
                      'keep exploring',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    )
                  ],
                ),
              ),
              addVerticalSpacing(50)
            ],
          ),
        ),
      ),
    );
  }

  Widget info({String? title, String? sub}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpacing(30),
        Text(
          title!,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
        addVerticalSpacing(7),
        Text(
          sub!,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
