import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';


class Utils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static bool isProgressShowing = false;


  static showProgress(BuildContext context) {
    if (!isProgressShowing) {
      isProgressShowing = true;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          });
    }
  }

  static hideProgress(BuildContext dialogContext) {
    if (isProgressShowing) {
      isProgressShowing = false;
      Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
    }
  }

  static double averageRating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

/*
  static void flushBarMessage(String message, BuildContext context,
      {Color? color}) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: color ?? Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }
*/

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePassword(String value) {
    String pattern = "^(?=.{8,16}\$)";
    //String pattern = "^(?=.{8,16}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool validatePhoneNumber(String value) {
    String pattern = "^([1-9]{1})([0-9]{9}\$)";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  /*
  This following method returns headers for all the requests.
 */
  static urlHeaders({String? requestBody}) {
    debugPrint("body: ${requestBody!}");
    String auth = "Encrypt.to(Mode.sha256, json.decode(requestBody).toString())";
    debugPrint("Auth: $auth");
    Map<String, String> headers = {
      //'Auth': auth,
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST',
      'Access-Control-Allow-Headers': 'X-Requested-With'
    };
    debugPrint("Headers: $headers");
    return headers;
  }

/*
  This following method check camera or gallery permission.
 */
/*
  static Future<bool?>? askPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isDenied || status.isLimited) {
      askPermission(permission);
    } else if (status.isPermanentlyDenied || status.isRestricted) {
      _showOpenAppSettingsDialog(permission);
    } else {
      return true;
    }
    return false;
  }
*/

/*
  static Future<dynamic> checkConnectivity(BuildContext context) async {
    bool isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.

      isConnected = true;
    } else {}
    return isConnected;
  }
*/

/*
  static _showOpenAppSettingsDialog(Permission permission) {
    return showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('$permission Permission'),
              content: Text('This app needs $permission to proceed further'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Deny'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoDialogAction(
                  child: const Text('Settings'),
                  onPressed: () => openAppSettings(),
                ),
              ],
            ));
  }
*/

  /*
The following method is used for logout.
 */
/*
  static logout(context) {
    User? user;
    user = Provider.of<UserViewModel>(context, listen: false).user;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(AppStrings.utils_logoutSnackbarText,
                style: TextStyle(fontSize: 16)),
            //content: Text(AppStrings.utils_logoutSnackbar),
            actions: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child:
                        const Text('Cancel', style: TextStyle(fontSize: 16.0))),
                TextButton(
                  onPressed: () {
                    logoutUser(user!.personnel_number.toString());
                    SharedPrefs.clear();
                    Navigator.pushNamedAndRemoveUntil(context,
                        RoutesName.login, (Route<dynamic> route) => false);
                  },
                  child: const Text('Ok', style: TextStyle(fontSize: 16.0)),
                )
              ]),
            ],
          );
        });

  }
*/

/*
  static Future<dynamic> logoutUser(String employeeId) async {

    final BaseApiServices _apiServices = NetworkApiService();
    var data = {"employeeId": employeeId};
    try {
      var response = await _apiServices.getPostApiResponse(
          AppUrl.logoutUser(), data);
      return response;
    } catch (e) {
      debugPrint('$e===============');
    }
  }
*/

}
