import 'dart:core' show List, String, int;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travas/Presentation/widget/constants.dart';

class UpcomingTour extends ChangeNotifier {
  List<String> upcomingTourImages = [
    'assets/UpcomingToursImages/ut1.jpg',
    'assets/UpcomingToursImages/ut2.jpg',
    'assets/UpcomingToursImages/ut3.jpg',
  ];
  List<String> upcomingTourImages2 = [
    'assets/UpcomingToursImages/ut1.jpg',
    'assets/UpcomingToursImages/ut2.jpg',
    'assets/UpcomingToursImages/ut3.jpg',
  ];
  List<String> upcomingTourImages3 = [
    'assets/UpcomingToursImages/ut1.jpg',
    'assets/UpcomingToursImages/ut2.jpg',
    'assets/UpcomingToursImages/ut3.jpg',
  ];

  List<String> upComingTourTitle = [
    'South Africa',
    'Madagascar',
    'Labadi Beach',
  ];

  List<String> upcomingTourDate = [
    'Lions Head,Cape Town',
    'Houses on the hill with green gardens and red soil',
    'Loading...',
  ];

  List<Widget> upcomingTourBody = [
    //kruger
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
          '''The big five: Elephant, Lion, Rhino, Leopard and Buffalo. Kruger park is home to a stunning diversity of wildlife, trees, flowers and most importantly The big five. Steeped in legend and history with exquisite accomodations and meals. Kruger national park is one of the most famous tourist destinations in the world. To get the real taste of a safari tour, book a tour to Kruger national park.'''),
    ),
    //camping
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
          '''Enjoy one of the best outdoor activities in the world in the beautiful city of Ilorin.
Our world has changed drastically since the pandemic and many people are feeling more isolated. Work from home has become the norm for many and social media, email and the general 24/7 noise of life can leave us more stressed out.
Disconnecting from technology and reconnecting with nature gives our brain a much-needed recharge, especially among those with sedentary occupations. Camping and Hiking helps you reconnect with nature, build better relationships and aids in overall physical and mental fitness'''),
    ),
    // labadi beach
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
          '''Also known as La pleasure beach. Labadi beach is one of the best beaches on the Ghana coast, filled with lots and lots of fun activities such as games, horse riding and most importantly, relaxing. Labadi beach is perfect for both couple and family vacations.'''),
    ),
  ];
  var newUpcomingTour;
  List<Padding> upcomingTourList = [];

// The original function to generate a list of Upcoming tour widgets
  List<Padding> getUpcomingTour(BuildContext context) {
    for (int i = 0; i < upcomingTourImages.length; i++) {
      String imagePath = upcomingTourImages[i];
      String title = upComingTourTitle[i];
      String desc = upcomingTourDate[i];
      newUpcomingTour = Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(desc),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                    onTap: () {
                      // Provider.of<UpcomingTour>(context, listen: false)
                      //     .addToBucketList(upcomingTourList[i]);
                      context
                          .read<UpcomingTour>()
                          .addToBucketList(upcomingTourList[i]);
                      Navigator.pop(context);
                      //Navigator.push(context, MaterialPageRoute(builder:(context)=>const))
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
      upcomingTourList.add(newUpcomingTour);
    }
    return upcomingTourList;
  }

// A modified function that removes the add icon displayed on the home screen.
  List<Padding> getUpcomingTourOnHome(BuildContext context) {
    List<Padding> upcomingTourList = [];
    for (int i = 0; i < upcomingTourImages.length; i++) {
      String imagePath = upcomingTourImages[i];
      String title = upComingTourTitle[i];
      String desc = upcomingTourDate[i];
      var newUpcomingTour = Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            GestureDetector(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => UpcomingTourView(imagePath,
              //               imagePath, imagePath, upcomingTourBody[i], title)));
              // },
              child: Container(
                width: 170.w,
                height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      image: AssetImage(
                        imagePath,
                      ),
                      fit: BoxFit.fill,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: kBoldTextStyleWhite,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                      ),
                      child: Text(
                        desc,
                        style: kBoldTextStyleWhite,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
      );
      upcomingTourList.add(newUpcomingTour);
    }
    return upcomingTourList;
  }

  List<Padding> bucketList = [];
  int get bucketListCount => bucketList.length;
  List<Padding> get upcomingTourscart => bucketList;

  void addToBucketList(Padding item) {
    bucketList.add(item);
    notifyListeners();
  }

  void removeFromBucketList(Padding item) {
    bucketList.remove(item);
    notifyListeners();
  }

  void clearBucketList() {
    bucketList.clear();
    notifyListeners();
  }
}
