import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travas/Presentation/screens/Onboarding/loginpage.dart';
import 'package:travas/Presentation/screens/Onboarding/registration.dart';
import 'package:travas/Presentation/widget/constants.dart';

class OnboardingPage extends StatefulWidget {
  static const String id = 'IntroductionScreen';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final onboardKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      imageAlignment: Alignment.center,
      bodyFlex: 2,
      imageFlex: 3,
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.only(top: 100),
      footerPadding: EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      key: onboardKey,
      initialPage: 0,
      freeze: false,
      globalBackgroundColor: Colors.white,
      pagesAxis: Axis.horizontal,
      pages: [
        PageViewModel(
          title: "Happiness is travelling",
          body: "Make new connections, relationships and friends",
          image: Container(
            height: 306.h,
            width: 267.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage('assets/p2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Discover new possibilities",
          body: "Book instant tickets to special events around the world",
          image: Container(
            height: 306.h,
            width: 267.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage('assets/p1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Explore your world",
          body: "Experience diverse cultures and religions",
          image: Container(
            height: 306.h,
            width: 267.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage('assets/p3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Enjoy authentic tourism",
          body: "Soak up the beauty of the world with 1go tourism",
          image: Container(
            height: 306.h,
            width: 267.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: DecorationImage(
                image: AssetImage('assets/p4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 63.h,
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginPage(),
                              type: PageTransitionType.rightToLeft));
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.blue,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              addHorizontalSpacing(20),
              Expanded(
                child: SizedBox(
                  height: 63.h,
                  width: 120.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: true,
      showNextButton: true,
      showDoneButton: false,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      next: const Icon(Icons.arrow_forward),
      // done: const Text('Done',
      //     style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
      dotsDecorator: const DotsDecorator(
        size: Size(5.0, 5.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
