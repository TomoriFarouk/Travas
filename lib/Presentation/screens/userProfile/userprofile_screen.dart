import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travas/Controller/userdata_controller.dart';
import 'package:travas/Presentation/widget/constants.dart';

class UserProfilePage extends StatefulWidget {
  static const String id = 'Userprofilepage';

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int numberOfBookedTours = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List? userDataList = Provider.of<UserData>(context).userDataList;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Center(
                  child: Icon(
                    Icons.person_add_alt,
                    size: 30,
                    color: Colors.white60,
                  ),
                ),
              ),
              addHorizontalSpacing(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${userDataList != null ? userDataList[1] : 'Loading...'}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  addVerticalSpacing(5),
                  Text(
                    '${userDataList != null ? userDataList[0] : 'Loading...'}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          )
          // IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            addVerticalSpacing(50),

            Text(
              'Account Information',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            addVerticalSpacing(30),
            profileCard(title: 'Personal details'),
            addVerticalSpacing(30),
            const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            addVerticalSpacing(20),

            Text(
              'Support',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            addVerticalSpacing(30),
            profileCard(title: 'Help center'),
            addVerticalSpacing(20),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            addVerticalSpacing(20),
            profileCard(title: 'About'),
            addVerticalSpacing(20),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            addVerticalSpacing(20),
            profileCard(title: 'Privacy policy'),
            addVerticalSpacing(20),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //       height: 50,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade100,
            //         border: Border.all(
            //           color: Colors.blue,
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Row(
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.only(left: 10),
            //             child: Text('First Name:'),
            //           ),
            //           addHorizontalSpacing(10),
            //           Text(
            //               '${userDataList != null ? userDataList[1] : 'Loading...'}'),
            //         ],
            //       ),
            //     ),
            //     addVerticalSpacing(20),
            //     Container(
            //       height: 50,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade100,
            //         border: Border.all(
            //           color: Colors.blue,
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Row(
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.only(left: 10),
            //             child: Text('Last Name:'),
            //           ),
            //           addHorizontalSpacing(10),
            //           Text(
            //               '${userDataList != null ? userDataList[2] : 'Loading...'}'),
            //         ],
            //       ),
            //     ),
            //     addVerticalSpacing(20),
            //     Container(
            //       height: 50,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade100,
            //         border: Border.all(
            //           color: Colors.blue,
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Row(
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.only(left: 10),
            //             child: Text('Phone Number:'),
            //           ),
            //           addHorizontalSpacing(10),
            //           Text(
            //               '${userDataList != null ? userDataList[3] : 'Loading...'}'),
            //         ],
            //       ),
            //     ),
            //     addVerticalSpacing(20),
            //     Container(
            //       height: 50,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade100,
            //         border: Border.all(
            //           color: Colors.blue,
            //         ),
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Row(
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.only(left: 10),
            //             child: Text('Email:'),
            //           ),
            //           addHorizontalSpacing(10),
            //           Text(
            //               '${userDataList != null ? userDataList[0] : 'Loading...'}'),
            //         ],
            //       ),
            //     ),
            //     addVerticalSpacing(20),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget profileCard({required String title}) {
    return Row(
      children: [
        Container(
          width: 130.w,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.sp),
          ),
        ),
        addHorizontalSpacing(150),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        )
      ],
    );
  }
}
