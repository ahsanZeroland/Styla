import 'package:flutter/material.dart';
import 'package:styla_vender/constants/color_constants.dart';
import 'package:styla_vender/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
          TextField(
            decoration: InputDecoration(
                labelText: 'Business Name',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
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
          TextField(
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
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'Industry Type',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'Contact Number',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'Email ID',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'State',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'LGA',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'Regional Code (Optional)',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'License Image',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.mainColor,
                ),
                child: Text(
                  'Upload Image',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(width: 7),
              Text(
                'Max Size 3mb',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
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
    );
  }
}
