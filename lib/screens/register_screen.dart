import 'package:flutter/material.dart';
import 'package:styla/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Text('Lets Get '),
              Text(
                'Started',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Text('Create an auount to access all Features',
              style: TextStyle(color: Colors.blue)),
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              height: 40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
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
            children: [
              Text('Already have an account?'),
              Text(
                'Login Here',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}
