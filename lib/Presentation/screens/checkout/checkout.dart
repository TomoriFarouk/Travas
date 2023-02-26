import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:travas/Presentation/helpers/validators.dart';
import 'package:travas/Presentation/screens/bookingscreen/booking_slip.dart';
import 'package:travas/Presentation/widget/constants.dart';
import 'package:travas/Presentation/widget/reusable_button.dart';

class Checkout extends StatefulWidget {
  const Checkout();

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var countryCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(width: 15.w),
              Text(
                'Checkout',
                style: kMediumTextStyleBlack,
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tourists details',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                addVerticalSpacing(16),
                Text(
                  'This information is required to confirm your booking',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(30),
                Text(
                  'Lead Tourist',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                addVerticalSpacing(20),
                Text(
                  'First name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                textFormField(label: 'First name'),
                addVerticalSpacing(25),
                Text(
                  'Last name',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                textFormField(label: 'Last name'),
                addVerticalSpacing(30),
                Text(
                  'Tourist 2',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                addVerticalSpacing(20),
                Text(
                  'First name*',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                textFormField(label: 'First name'),
                addVerticalSpacing(25),
                Text(
                  'Last name*',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                textFormField(label: 'Last name'),
                addVerticalSpacing(30),
                Text(
                  'Contact information',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                addVerticalSpacing(20),
                Text(
                  'Email address*',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: emailvalidator,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    // email = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    hintText: 'Email address',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
                addVerticalSpacing(25),
                Text(
                  'Mobile number*',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                addVerticalSpacing(10),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
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
                    addVerticalSpacing(10),
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
                        // phonenumber = countryCode + value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        hintText: 'Mobile number',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                ),
                addVerticalSpacing(150),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: ReusableButton(const Text('Checkout'), () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BookingSlip()));
                  }),
                ),
                addVerticalSpacing(30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormField({String? label}) {
    return TextFormField(
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().minLength(2).maxLength(20).build(),
      onChanged: (value) {
        label = value;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        hintText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
    );
  }
}
