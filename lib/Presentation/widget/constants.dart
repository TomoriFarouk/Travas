import 'package:flutter/material.dart';

const kBoldTextStyleBlack = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.black,
);
const kMediumTextStyleBlack = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: Colors.black,
);
const kBlackText = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
);

const kBoldTextStyleWhite = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: Colors.white,
);

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

const fetchVideoError = SnackBar(
  backgroundColor: Colors.black,
  content: Text('Could\'nt Load Video'),
);

const successLoginSnackbar = SnackBar(
  backgroundColor: Colors.green,
  content: Text('You have logged in Successfully!'),
);

const noNetworkSnackbar = SnackBar(
  backgroundColor: Colors.black,
  content: Text('Check your Internet Connection'),
);

const fetchDetailsError = SnackBar(
  backgroundColor: Colors.black,
  content: Text('Could\'nt fetch User details'),
);

const successRegisterSnackbar = SnackBar(
  backgroundColor: Colors.green,
  content: Text('You have Registered Successfully!'),
);

const somethingWrongSnackbar = SnackBar(
  backgroundColor: Colors.black,
  duration: Duration(seconds: 4),
  content:
      Text('Something went wrong on our end, We are working on it please.'),
);
