import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/avd.dart';
import 'package:http/http.dart';
import 'package:travas/Presentation/screens/upcomingtourview/choose_number_of_tourist.dart';
import 'package:travas/Presentation/widget/carousel_slider_widget.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';
import 'package:travas/Presentation/widget/review_card.dart';

class UpcomingTourView extends StatelessWidget {
  static const String id = 'Campingandhiking';
  final String body;
  final String heading;
  final List<String> cImage1;

  const UpcomingTourView({
    required this.cImage1,
    required this.body,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    //final FoodsInQatars _foodsInQatar = FoodsInQatars();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'About the Destination',
                    style: kMediumTextStyleBlack,
                  ),
                ],
              ),
              backgroundColor: Colors.white,
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CarouselSliderWidget(cImage1, 'full'),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    heading,
                    style: kBoldTextStyleBlack,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    '#500,000  per person',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 19.sp),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '$heading mountain resort, cross river state',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '23rd-26th September, 2022',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Meeting point: Cross river state Airport',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Start time: 9:00AM',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Language offered in: English',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Itinerary',
                    style: kBoldTextStyleBlack,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(body),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'What to expect',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Luxury accommodation',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Spectacular scenery',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Caring and informative tour guide',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Amazing local dishes',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                addVerticalSpacing(20),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'For Enquires',
                    style: kMediumTextStyleBlack,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Travas help centre',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  height: 100.h,
                  color: Colors.orange[300],
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 16.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cancellation policy',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Text(
                            'All sales are final and incure 100%',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'cancellation penalities',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          )
                        ]),
                  ),
                ),
                addVerticalSpacing(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          'Photos',
                          style: kBoldTextStyleBlack,
                        )
                      ],
                    ),
                  ),
                ),
                addVerticalSpacing(10),
                // Padding(
                //   padding: EdgeInsets.only(left: 16),
                //   child: SizedBox(
                //     height: 150,
                //     child: ListView(
                //       scrollDirection: Axis.horizontal,
                //       physics: const ClampingScrollPhysics(),
                //       children: _foodsInQatar.getFoodsInQatar(context),
                //     ),
                //   ),
                // ),
                addVerticalSpacing(50),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Guidelines',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Children below the age of 5 years are not allowed',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Individuals above age of 70 is not allowed',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                addVerticalSpacing(30),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Tour Guide',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                addVerticalSpacing(10),
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
                addVerticalSpacing(10),
                Center(
                  child: Text(
                    'Williams Kennedy',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                addVerticalSpacing(10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      height: 36.h,
                      child: Text(
                        'A passionate soul, a nature lover, a culture lover,and someone who loves making people happy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                addVerticalSpacing(100),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Ever been to Obudu mountain ?',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                addVerticalSpacing(15),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Rate your experience',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconTheme(
                    data: IconThemeData(
                      color: Color(0xffACAAAA),
                      size: 24,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 0 ? Icons.star : Icons.star_border,
                          color: Color(0xffACAAAA),
                        );
                      }),
                    ),
                  ),
                ),
                addVerticalSpacing(50),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Reviews',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ReviewCard(),
                        ReviewCard(),
                        ReviewCard(),
                        ReviewCard(),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ReusableButton(const Text('Book Package'), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NumberOFTourist()));
                  }),
                ),
              ],
            )));
  }

  Widget textArea(
      {String? labelText,
      String? hintText,
      TextEditingController? controller}) {
    return Container(
      child: TextFormField(
        controller: controller,
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 16, 10, 20),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
