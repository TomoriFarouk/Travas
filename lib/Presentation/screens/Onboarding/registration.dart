import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travas/Presentation/helpers/validators.dart';
import 'package:travas/Presentation/screens/Onboarding/loginpage.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'RegistrationPage';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = '';
  String password = '';
  bool showSpinner = false;
  String firstname = '';
  String lastname = '';
  bool passwordVisible = true;
  var countryCode;
  String phonenumber = '';
  String? registrationErrorMessage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  String password2 = '';

  void stopSpinning() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinning() {
    setState(() {
      showSpinner = true;
    });
  }

  // void registerUserOnBackend(BuildContext context) async {
  //   final navigator = Navigator.of(context);
  //   final scaffold = ScaffoldMessenger.of(context);
  //   startSpinning();
  //   try {
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://explore.pythonanywhere.com/api/register'));
  //     request.fields.addAll({
  //       'first_name': firstname,
  //       'last_name': lastname,
  //       'email': email,
  //       'password': password,
  //       'password2': password2,
  //       'phone_number': phonenumber,
  //     });
  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 201) {
  //       navigator.pushReplacement(PageTransition(
  //           child: const SuccessRegistration(),
  //           type: PageTransitionType.rightToLeft));
  //       stopSpinning();
  //     } else if (response.statusCode == 400) {
  //       var responseString = await response.stream.bytesToString();
  //       final decodedResult = await jsonDecode(responseString);
  //       setState(() {
  //         registrationErrorMessage = decodedResult['details'];
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
  //     print('error 2');
  //     setState(() {
  //       stopSpinning();
  //       scaffold.showSnackBar(noNetworkSnackbar);
  //     });
  //   }
  // }

  Widget showAlert() {
    if (registrationErrorMessage != null) {
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
              Flexible(child: Text(registrationErrorMessage!)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      registrationErrorMessage = null;
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

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 15.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);

    String bullet = '\u2022';
    return SafeArea(
      child: ModalProgressHUD(
        //color: Colors.blue.shade600,
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 13.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(10.0),
                children: [
                  addVerticalSpacing(5),
                  showAlert(),
                  addVerticalSpacing(50),
                  const Text(
                    'Register',
                    style: kBoldTextStyleBlack,
                    textAlign: TextAlign.left,
                  ),
                  addVerticalSpacing(20),
                  Row(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        validator: ValidationBuilder()
                            .minLength(2)
                            .maxLength(20)
                            .build(),
                        onChanged: (value) {
                          firstname = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          hintText: 'First name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                      addHorizontalSpacing(20),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ValidationBuilder()
                            .minLength(2)
                            .maxLength(20)
                            .build(),
                        onChanged: (value) {
                          lastname = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          hintText: 'Last name',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(20),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: emailvalidator,
                    keyboardType: TextInputType.emailAddress,
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
                  addVerticalSpacing(20),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.r))),
                          child: CountryCodePicker(
                              onChanged: (code) {
                                countryCode = code.toString();
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'NG',
                              favorite: const [
                                '+234',
                                'NG',
                                '+233',
                                '+254',
                                '+971',
                                '+255'
                              ],
                              //  countryFilter: ['IT', 'FR'],
                              showFlagDialog: false,
                              onInit: (code) {
                                countryCode = code.toString();
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      //addVerticalSpacing(10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 10,
                        validator: ValidationBuilder()
                            .minLength(10)
                            .maxLength(15)
                            .build(),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          phonenumber = countryCode + value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          hintText: 'Mobile number',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                      addVerticalSpacing(20),
                    ],
                  ),
                  addVerticalSpacing(20),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordVisible,
                    obscuringCharacter: '*',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: passwordValidator,
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
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: const Icon(Icons.visibility)),
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                  addVerticalSpacing(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(bullet),
                            addVerticalSpacing(5),
                            const Text('Password should be 6-12 characters')
                          ],
                        ),
                      ),
                      addVerticalSpacing(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(bullet),
                            addVerticalSpacing(5),
                            const Text(
                                'Password should have an upper case letter')
                          ],
                        ),
                      ),
                      addVerticalSpacing(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(bullet),
                            addVerticalSpacing(5),
                            const Text(
                                'Password should have a lower case letter')
                          ],
                        ),
                      ),
                      addVerticalSpacing(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(bullet),
                            addVerticalSpacing(5),
                            const Text(
                                'Password should have a number or a symbol')
                          ],
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(20),
                  TextFormField(
                    controller: confirmPassController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordVisible,
                    obscuringCharacter: '*',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password2 = value;
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
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: const Icon(Icons.visibility)),
                      hintText: 'Confirm password',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                  addVerticalSpacing(20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'By registering, I agree to ',
                          style: defaultStyle,
                        ),
                        TextSpan(
                            text: 'Privacy policy',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(text: ' and ', style: defaultStyle),
                        TextSpan(
                            text: 'Terms of use',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]),
                    ),
                  ),
                  addVerticalSpacing(20),
                  ReusableButton(const Text('Register'), () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        registrationErrorMessage = null;
                      });
                     // registerUserOnBackend(context);
                    }
                  }),
                  addVerticalSpacing(40),
                  Center(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account ? ',
                          style: defaultStyle,
                        ),
                        TextSpan(
                            text: 'Login ',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: LoginPage(),
                                        type: PageTransitionType.rightToLeft));
                              }),
                      ]),
                    ),
                  ),
                  addVerticalSpacing(50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessRegistration extends StatelessWidget {
  const SuccessRegistration({Key? key}) : super(key: key);
  static const String id = 'SuccessReg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          addVerticalSpacing(100),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 90,
          ),
          addVerticalSpacing(90),
          Center(
            child: const Text(
              'Registration Successful',
              style: kBoldTextStyleBlack,
            ),
          ),
          addVerticalSpacing(100),
          Row(
            children: [
              ReusableButton(const Text('Go to Login'), () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: LoginPage(),
                        type: PageTransitionType.rightToLeft));
              }),
            ],
          )
        ],
      ),
    );
  }
}
