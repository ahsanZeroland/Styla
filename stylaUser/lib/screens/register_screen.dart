import 'package:flutter/material.dart';
import 'package:styla/data/validator/validator.dart';
import 'package:styla/providers/api_client.dart';
import 'package:styla/screens/login_screen.dart';
import 'package:styla/screens/themes/color_theme.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Validator validator = Validator();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  ApiClient client = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 40),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lets Get ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Started',
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            Center(
              child: Text('Create an auount to access all Features',
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              validator: validator.validateName,
              decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: emailController,
              validator: validator.validateEmail,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: phoneController,
              validator: validator.validateMobile,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: countryController,
              decoration: InputDecoration(
                  labelText: 'Country',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              validator: validator.validatePasswordLength,
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              obscureText: true,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              validator: validator.validatePasswordLength,
              controller: conPassController,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              obscureText: true,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isLoading = true;
                    _formKey.currentState.save();
                    Map<String, String> userdata = {
                      'name': nameController.text,
                      'email': emailController.text,
                      'phone': phoneController.text,
                      'country': countryController.text,
                      'password': passwordController.text,
                    };
                    print(userdata);
                    client
                        .auth('/styla/auth/signup', userdata)
                        .then((response) {
                      if (response != null) {
                        print(response);
                        // if (response['status'] != true) {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   print('your password or username is incorret');
                        // } else {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => LoginScreen()));
                        // }
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                        print('check your internet connection..');
                      }
                    });
                  });
                }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.blueAccent,
                  color: AppColor.mainColor,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Login Here',
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
