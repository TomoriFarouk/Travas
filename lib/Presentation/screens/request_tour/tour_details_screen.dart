import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:travas/Data/model/requesttour_model.dart';
import 'package:travas/Presentation/screens/request_submitted_page.dart';
import 'package:travas/Presentation/widget/carousel_slider_widget.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';
import 'package:travas/Presentation/widget/review_card.dart';

class TourDetailsScreen extends StatefulWidget {
  final RequestTour requestTour;
  const TourDetailsScreen({required this.requestTour});

  @override
  State<TourDetailsScreen> createState() => _TourDetailsScreenState();
}

class _TourDetailsScreenState extends State<TourDetailsScreen> {
  var dateSelectController1 = TextEditingController();
  var dateSelectController2 = TextEditingController();
  bool? _checkedValue1 = false;
  bool? _checkedValue2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              CarouselSliderWidget(widget.requestTour.imageUrl, 'half'),
              addVerticalSpacing(15),
              Text(
                widget.requestTour.name,
                style: kBoldTextStyleBlack,
              ),
              addVerticalSpacing(15),
              Text(widget.requestTour.body),
              addVerticalSpacing(50),
              Text('Reviews',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
              addVerticalSpacing(19),
              ReviewCard(
                review: 'half',
              ),
              ReviewCard(
                review: 'half',
              ),
              ReviewCard(
                review: 'half',
              ),
              ReviewCard(
                review: 'half',
              ),
              addVerticalSpacing(19),
              const Text(
                'Tell us how you would want your package to be. \n Submit your preferences and something amazing \n would be prepaired for you.',
                style: TextStyle(color: Color(0xff575656)),
              ),
              addVerticalSpacing(37),
              Row(
                children: [
                  Text('Destination : '),
                  Text(widget.requestTour.name,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              addVerticalSpacing(37),
              Text('Categories',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
              addVerticalSpacing(10),
              Text(
                'Select the category of tour you would like',
                style: TextStyle(color: Color(0xff575656)),
              ),
              addVerticalSpacing(31),
              categoryCard(
                  title: 'Group',
                  detail1: 'I am open to meeting \n new people ',
                  detail2:
                      'I would love to go on this \n tour with fellow tourists ',
                  assets: 'assets/people.png'),
              addVerticalSpacing(30),
              categoryCard(
                  title: 'Private',
                  detail1: 'Keep it private',
                  detail2:
                      'I would bring along friends, family \n or simply just me',
                  assets: 'assets/people.png'),
              addVerticalSpacing(30),
              categoryCard(
                  title: 'Romantic',
                  detail1: 'Honeymoon/dates',
                  detail2:
                      'I would love to have a good \n time with my significant other ',
                  assets: 'assets/Group 544.png'),
              addVerticalSpacing(45),
              Text('Tour duration',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
              addVerticalSpacing(10),
              Text(
                'Select the start and end date of your tour',
                style: TextStyle(color: Color(0xff575656)),
              ),
              addVerticalSpacing(10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Date',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            height: 34.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: TextFormField(
                              controller: dateSelectController1,
                              decoration: InputDecoration(
                                fillColor: Color(0xffD9D9D9),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(360.r)),
                                ),
                                // focusColor: Colors.transparent,
                                hintText: 'DD-MM-YY',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1890),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors.black,
                                          onPrimary: Color(0xffFFFFFF),
                                          onSurface: Color(0xff676767),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary: const Color(0xffFF4500),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickeddate != null) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickeddate);

                                  setState(() {
                                    dateSelectController1.text = formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End Date',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            height: 34.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: TextFormField(
                              controller: dateSelectController2,
                              decoration: InputDecoration(
                                fillColor: Color(0xffD9D9D9),
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(360.r)),
                                ),
                                // focusColor: Colors.transparent,
                                hintText: 'DD-MM-YY',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1890),
                                  lastDate: DateTime(2100),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors.black,
                                          onPrimary: Color(0xffFFFFFF),
                                          onSurface: Color(0xff676767),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary: const Color(0xffFF4500),
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickeddate != null) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickeddate);

                                  setState(() {
                                    dateSelectController2.text = formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
                        ]),
                  ]),
              addVerticalSpacing(36),
              Theme(
                data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)))),
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  visualDensity: VisualDensity.compact,
                  activeColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Single day tour',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checkedValue1,
                  onChanged: (newValue) {
                    setState(() {
                      _checkedValue1 = newValue;
                    });
                  },
                ),
              ),
              addVerticalSpacing(30),
              Text('Activity',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
              addVerticalSpacing(10),
              Text(
                'Have any particular activity you  would carry out \n during your tour?',
                style: TextStyle(color: Color(0xff575656)),
              ),
              addVerticalSpacing(22),
              Container(
                height: 49.h,
                width: 299.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(360.r)),
                    color: Color(0xffD9D9D9)),
                child: TextFormField(
                  onChanged: (value) {
                    //firstname = value;
                  },
                  decoration: InputDecoration(
                    fillColor: Color(0xffD9D9D9),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(360.r)),
                    ),
                    // focusColor: Colors.transparent,
                    // hintText: 'Choose your destination ...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
              ),
              addVerticalSpacing(30),
              Theme(
                data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)))),
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  visualDensity: VisualDensity.compact,
                  activeColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'No preference',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _checkedValue2,
                  onChanged: (newValue) {
                    setState(() {
                      _checkedValue2 = newValue;
                    });
                  },
                ),
              ),
              addVerticalSpacing(40),
              Text(
                'You would be notified once an/a exact/similar tour \n package have been uploaded by any of our \n amazing tour operators ',
                style: TextStyle(color: Color(0xff575656)),
              ),
              addVerticalSpacing(40),
              ReusableButton(const Text('Submit'), () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RequestSubmittedPage()));
              }),
              addVerticalSpacing(50),
            ],
          ),
        ));
  }

  Widget categoryCard(
      {required String title,
      required String detail1,
      required String detail2,
      required String assets}) {
    return Container(
      height: 90.h,
      width: 328.w,
      decoration: BoxDecoration(
          color: Color(0xffE5E5E5),
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 15.h,
          width: 15.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            Image.asset(assets)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(detail1,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
            Text(detail2,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
          ],
        )
      ]),
    );
  }
}
