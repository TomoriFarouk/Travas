import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travas/Data/model/carousel_view_model.dart';
import 'package:travas/Presentation/screens/upcomingtourview/upcoming_tour_view.dart';
import 'package:travas/Presentation/widget/constants.dart';

class HomeCarousel extends StatelessWidget {
  final Carousell splash;

  const HomeCarousel({required this.splash});
  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpcomingTourView(
                      cImage1: splash.imageUrl,
                      body: splash.body,
                      heading: splash.name,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      splash.imageUrl[0],
                    ),
                    fit: BoxFit.fill,
                  )),
            ),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Container(
                height: 90,
                color: Color(0xF5F5F5),
                // decoration: BoxDecoration(
                //     border: Border.all(width: 5, color: Colors.grey),
                //     ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 13.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            splash.name,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          addVerticalSpacing(15),
                          IconTheme(
                            data: IconThemeData(
                              color: Color(0xffFF9900),
                              size: 16,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  color: Color(0xffFF9900),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: Text(
                        splash.price,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
