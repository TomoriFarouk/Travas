import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travas/Presentation/widget/constants.dart';

class RequestSubmittedPage extends StatelessWidget {
  static const String id = 'Requestsubmittedpage';
  const RequestSubmittedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                addVerticalSpacing(100),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 70,
                ),
                addVerticalSpacing(50),
                Center(
                    child: Text(
                  'Your request has been submibtted successfully',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                )),
                addVerticalSpacing(40),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                          'You would be notified once an/a exact/similar \n tour package have been uploaded by any of our \n amazing tour operators ')),
                ),
                addVerticalSpacing(40),
                Center(
                  child: Text(
                    'Relax as we prepare something amazing just for you',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                addVerticalSpacing(100),
                Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.blue,
                        ),
                        addHorizontalSpacing(15),
                        Text(
                          'keep exploring',
                          style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // ReusableButton(const Text('Home  >'), () {
            //   Navigator.pushReplacementNamed(context, MainScreen.id);
            // }),
          ],
        ),
      ),
    );
  }
}
