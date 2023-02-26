import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:travas/Data/model/requesttour_model.dart';
import 'package:travas/Presentation/screens/request_tour/tour_details_screen.dart';
import 'package:travas/Presentation/widget/constants.dart';

class RequestTourScreen extends StatelessWidget {
  final List<RequestTour> requestTour;
  RequestTourScreen({required this.requestTour});

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
              'Request Tour',
              style: kMediumTextStyleBlack,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us how you would want your package to be \n,let us know your preference and something \n amazing would be prepared just for you.',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            addVerticalSpacing(12),
            Text(
              'learn more',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            ),
            addVerticalSpacing(30),
            Container(
              height: 36.h,
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
                  hintText: 'Choose your destination ...',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ),
            addVerticalSpacing(40),
            Text(
              'Select Destination',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            addVerticalSpacing(12),
            SizedBox(
              height: 555.h,
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // padding: const EdgeInsets.all(4.0),
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: requestTour.length,
                itemBuilder: (ctx, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TourDetailsScreen(
                                  requestTour: requestTour[i])));
                    },
                    child: Container(
                      width: 157.w,
                      height: 185.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstATop),
                            image: AssetImage(
                              'assets/hm3.jpg',
                            ),
                            fit: BoxFit.fill,
                          )),
                      child: Padding(
                        padding: EdgeInsets.only(top: 150.h, left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              requestTour[i].name,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            addVerticalSpacing(15),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                requestTour[i].body,
                                style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            addVerticalSpacing(8),
                            IconTheme(
                              data: IconThemeData(
                                color: Color(0xffFF9900),
                                size: 16,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < requestTour[i].price
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Color(0xffFF9900),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
