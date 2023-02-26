import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travas/Controller/userdata_controller.dart';
import 'package:travas/Data/model/bucketlistmodel.dart';
import 'package:travas/Presentation/screens/Onboarding/loginpage.dart';
import 'package:travas/Presentation/screens/Onboarding/registration.dart';
import 'package:travas/Presentation/screens/Onboarding/splash_screen.dart';
import 'package:travas/Presentation/screens/home/home_screen.dart';

int? initScreen;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white60));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData()),
        ChangeNotifierProvider(create: (context) => UpcomingTour()),
      ],
      child: ScreenUtilInit(
          designSize: Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (child) {
            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
              ),
              routes: {
                LoginPage.id: (context) => LoginPage(),
                Splash.id: (context) => const Splash(),
                RegistrationPage.id: (context) => const RegistrationPage(),
                //  Home.id: (context) => const Home(),
                // OnboardingPage.id: (context) => const OnboardingPage(),
                ////  Qatar.id: (context) => const Qatar(),
                //NotificationsPage.id: (context) => const NotificationsPage(),
                // TourAgentPage.id: (context) => TourAgentPage(),
                // TourDetailsSingle.id: (context) => const TourDetailsPage(),
                // BucketList.id: (context) => const BucketList(),
                // SelectCategory.id: (context) => SelectCategory(),
                // CreateBucketListPage.id: (context) =>
                //     const CreateBucketListPage(),
                // TourDetailsCouple.id: (context) => const TourDetailsCouple(),
                // TourDetailsMultiple.id: (context) =>
                //     const TourDetailsMultiple(),
                // ThreePeoplePage.id: (context) => const ThreePeoplePage(),
                // RequestSubmittedPage.id: (context) =>
                //     const RequestSubmittedPage(),
                // FourPeoplePage.id: (context) => const FourPeoplePage(),
                // FivePeoplePage.id: (context) => const FivePeoplePage(),
                // PaymentPage.id: (context) => const PaymentPage(),
                // PaymentSuccess.id: (context) => PaymentSuccess(),
                // PaymentFailed.id: (context) => PaymentFailed(),
                // UserProfilePage.id: (context) => UserProfilePage(),
                // TourAgentDetails.id: (context) => TourAgentDetails(),
                // MainScreen.id: (context) => const MainScreen(),
                // SuccessRegistration.id: (context) => const SuccessRegistration()
              },
              debugShowCheckedModeBanner: false,
              initialRoute: //MainScreen.id
                  Splash.id,
            );
          }),
    );
  }
}
