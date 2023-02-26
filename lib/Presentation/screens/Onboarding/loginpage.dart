import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travas/Controller/userdata_controller.dart';
import 'package:travas/Presentation/helpers/validators.dart';
import 'package:travas/Presentation/screens/Onboarding/registration.dart';
import 'package:travas/Presentation/screens/home/home_screen.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'Loginpage';
  var loggedInUserAccessCode;

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 15.0);
  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  bool showSpinner = false, isPssswordVisible = true;

  String email = '';

  String password = '';

  String? loginErrorMessage;
  var loggedinUserRefreshCode,
      userFirstName,
      userLastname,
      userEmail,
      userPhone;
  List userDataList = [];

  Widget showAlert() {
    if (loginErrorMessage != null) {
      return Container(
        height: 100,
        padding: const EdgeInsets.all(8.0),
        color: Colors.amberAccent,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.error_outline),
              addHorizontalSpacing(10),
              Flexible(child: Text(loginErrorMessage!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      loginErrorMessage = null;
                    });
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void startSpinning() {
    setState(() {
      showSpinner = true;
    });
  }

  void stopSpinning() {
    setState(() {
      showSpinner = false;
    });
  }

  // Future<String?> logUserIn(BuildContext context) async {
  //   final navigator = Navigator.of(context);
  //   final scaffold = ScaffoldMessenger.of(context);
  //   final provider = Provider.of<UserData>(context, listen: false);
  //   try {
  //     startSpinning();
  //     var headers = {"Access-Control-Allow-Origin": "*"};
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://explore.pythonanywhere.com/auth/login'));
  //     request.fields.addAll({
  //       'email': email,
  //       'password': password,
  //     });
  //     request.headers.addAll(headers);
  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       var responseString = await response.stream.bytesToString();
  //       final decodedResult = jsonDecode(responseString);
  //       widget.loggedInUserAccessCode = decodedResult['access'];
  //       loggedinUserRefreshCode = decodedResult['refresh'];
  //       List? userData =
  //           await getUserDetailsFromApi(widget.loggedInUserAccessCode);
  //       provider.getUserdataAsList(userData!);
  //       stopSpinning();
  //       navigator.pushReplacement(PageTransition(
  //           child: const MainScreen(), type: PageTransitionType.rightToLeft));

  //       scaffold.showSnackBar(successLoginSnackbar);
  //     } else if (response.statusCode == 401 || response.statusCode == 400) {
  //       var responseString = await response.stream.bytesToString();
  //       final decodedResult = await jsonDecode(responseString);
  //       setState(() {
  //         loginErrorMessage = decodedResult['detail'];
  //       });
  //       stopSpinning();
  //     } else if (response.statusCode == 500 || response.statusCode == 501) {
  //       setState(() {
  //         stopSpinning();
  //         ScaffoldMessenger.of(context).showSnackBar(somethingWrongSnackbar);
  //       });
  //     } else {
  //       stopSpinning();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     setState(() {
  //       stopSpinning();
  //       ScaffoldMessenger.of(context).showSnackBar(noNetworkSnackbar);
  //     });
  //   }
  //   return widget.loggedInUserAccessCode;
  // }

  // Future<List?> getUserDetailsFromApi(String accessCode) async {
  //   var headers = {'Authorization': 'Bearer $accessCode'};
  //   var request = http.Request(
  //       'GET', Uri.parse('https://explore.pythonanywhere.com/api/me'));
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var responseString = await response.stream.bytesToString();
  //     final decodedResult = jsonDecode(responseString);
  //     userFirstName = decodedResult['first_name'];
  //     userLastname = decodedResult['last_name'];
  //     userEmail = decodedResult['email'];
  //     userPhone = decodedResult['phone_number'];
  //     userDataList.add(userEmail);
  //     userDataList.add(userFirstName);
  //     userDataList.add(userLastname);
  //     userDataList.add(userPhone);
  //   } else if (response.statusCode == 401) {
  //     setState(() {
  //       ScaffoldMessenger.of(context).showSnackBar(fetchDetailsError);
  //     });
  //   } else {
  //     // TODO1 handle 500 internal server error here.
  //   }
  //   return userDataList;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10.0),
              children: [
                addVerticalSpacing(5),
                showAlert(),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      addVerticalSpacing(100),
                      Container(
                        height: 63.h,
                        width: 63.w,
                        child: Image.asset('assets/Travas Logo.jpg'),
                      ),
                      addVerticalSpacing(88),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w, right: 33.w),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Login',
                              style: kBoldTextStyleBlack,
                            ),
                          ),
                          addVerticalSpacing(45),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: emailvalidator,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              hintText: 'Email address',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                          addVerticalSpacing(40),
                          TextFormField(
                            validator: passwordValidator,
                            obscureText: isPssswordVisible,
                            obscuringCharacter: '*',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPssswordVisible = !isPssswordVisible;
                                    });
                                  },
                                  child: const Icon(Icons.visibility)),
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                            ),
                          ),
                          addVerticalSpacing(100),
                          ReusableButton(
                            const Text('Login'),
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            },
                            // () async {
                            //   final provider =
                            //       Provider.of<UserData>(context, listen: false);

                            //   if (_formKey.currentState!.validate()) {
                            //     setState(() {
                            //       loginErrorMessage = null;
                            //     });

                            //     String? accessCodeReturned4rmLoginApi =
                            //         await logUserIn(context);
                            //     provider.getAccessCode(
                            //         accessCodeReturned4rmLoginApi!);
                            //   }
                            //}
                          ),
                          addVerticalSpacing(30),
                          Center(
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'Forgot pasword ?',
                                    style: linkStyle.copyWith(fontSize: 15),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {}),
                              ]),
                            ),
                          ),
                          addVerticalSpacing(5),
                          Center(
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'Don\'t have an account yet ? ',
                                  style: defaultStyle,
                                ),
                                TextSpan(
                                    text: 'Register',
                                    style: linkStyle,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegistrationPage()));
                                      }),
                              ]),
                            ),
                          ),
                          addVerticalSpacing(5),
                        ]),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
