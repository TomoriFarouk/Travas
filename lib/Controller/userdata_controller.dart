import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  String? userAccessCode;
  String? userRefreshCode;
  List? userDataList;

  void getAccessCode(String accessCodeFromLoginApi) {
    userAccessCode = accessCodeFromLoginApi;
    notifyListeners();
  }

  void getRefreshCode(String refreshCodeFromLoginApi) {
    userRefreshCode = refreshCodeFromLoginApi;
    notifyListeners();
  }

  void getUserdataAsList(List userDataListFromApi) {
    userDataList = userDataListFromApi;
    notifyListeners();
  }
}
