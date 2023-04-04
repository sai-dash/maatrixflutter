import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maatrixflutter/view/OTPVerifyScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneController = TextEditingController();
   String? _mobileError;

  void _validateInputs() {
    String mobile = _phoneController.text;
    String emailError = _validateMobile(mobile);
    setState(() {
      _mobileError = emailError;

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                child: TextField(
                  maxLength: 10,

                  textAlign: TextAlign.center,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText:  'Enter mobile number',
                  ),
                  /*onChanged: (value) {
                    if (value.length < 10 || !isNumeric(value)) {
                      Fluttertoast.showToast(
                          msg: "Mobile number most be 10 digits",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.lightGreenAccent,
                          fontSize: 16.0
                      );
                    } else {
                      // The input is valid
                    }
                  },*/
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _validateInputs();
                  },
                  child: Text('Get OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool isNumeric(String value) {
    return value != null && value.isNotEmpty && double.tryParse(value) != null;
  }
  String _validateMobile(String value) {
    final emailRegex = RegExp(r'/^(\+\d{1,3}[- ]?)?\d{10}$/');
    if (value.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter mobile number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.lightGreenAccent,
          fontSize: 16.0
      );
    }else if (!emailRegex.hasMatch(value)) {
      Fluttertoast.showToast(
          msg: "Please enter a valid mobile number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.lightGreenAccent,
          fontSize: 16.0
      );
    }else{

    }
    return value;
  }


}