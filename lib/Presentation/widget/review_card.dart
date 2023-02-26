import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travas/Presentation/widget/constants.dart';

class ReviewCard extends StatelessWidget {
  String? review;
  ReviewCard({this.review});

  @override
  Widget build(BuildContext context) {
    return review == 'half'
        ? Row(
            children: [
              Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Container(
                    width: 355.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            // SvgPicture.asset(
                            //   widget.review.image![0],
                            // ),
                            Container(
                              height: 40.h,
                              width: 40.h,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(''),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 19.w),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.37.h),
                                    child: Text(
                                      'Anonymous', //widget.review.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 12.sp,
                                              color: Colors.black),
                                    ),
                                  ),
                                  IconTheme(
                                    data: IconThemeData(
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                    child: IconTheme(
                                      data: IconThemeData(
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(5, (index) {
                                          return Icon(
                                            index < 4
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.amber,
                                          );
                                        }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),

                          Padding(
                            padding: EdgeInsets.only(top: 8.h, right: 10.w),
                            child: Text(
                              '''I visited Nigeria due to Job relocation. Nigeria is sucah \n a beauty with vibrant culture and friencl people.''',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 8.h),
                          //   child: Text(
                          //     widget.review.date,
                          //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          //           fontSize: 12.sp,
                          //         ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )),
              SizedBox(width: 16.w)
            ],
          )
        : Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 230.w,
                                child: Text(
                                  'George Kernel I had a nice time with my family here. It was such a beautiful vacation. we made memories.', //widget.review.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 10.sp, color: Colors.black),
                                ),
                              ),
                              addVerticalSpacing(5),
                              Row(
                                children: [
                                  Text(
                                    'Reply',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                  ),
                                  addHorizontalSpacing(10),
                                  Text(
                                    'Translate',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 10.sp,
                                            color: Colors.grey),
                                  ),
                                ],
                              )
                              // IconTheme(
                              //   data: IconThemeData(
                              //     color: Colors.amber,
                              //     size: 12,
                              //   ),
                              //   child: StarDisplay(value: rating),
                              // )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '10 min ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 12.sp, color: Colors.grey),
                              ),
                              IconTheme(
                                data: IconThemeData(
                                  color: Color(0xffACAAAA),
                                  size: 24,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(1, (index) {
                                    return Icon(
                                      index < 0
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Color(0xffACAAAA),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          )
                        ]),
                  )),
              addVerticalSpacing(10)
            ],
          );
  }
}
