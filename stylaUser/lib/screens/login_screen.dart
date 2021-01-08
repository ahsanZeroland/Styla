import 'package:flutter/material.dart';
import 'package:styla/providers/api_client.dart';
import 'package:styla/screens/register_screen.dart';
import 'package:styla/screens/stay_screen.dart';
import 'package:styla/screens/themes/color_theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  ApiClient client = ApiClient();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Image.asset('assets/logostyla.png',
                        height: 100, width: 100),
                    SizedBox(height: 10),
                    Center(
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 15),
                    Text('Fill the below \ninformation to login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: AppColor.mainColor)),
                    Container(
                        padding:
                            EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue))),
                              obscureText: true,
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, right: 20.0),
                                  child: buildRemembermeCb(),
                                ),
                                Container(
                                  alignment: Alignment(1.0, 0.0),
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 20.0),
                                  child: InkWell(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                    _formKey.currentState.save();
                                    Map<String, String> userdata = {
                                      'email': emailController.text,
                                      'password': passwordController.text,
                                    };
                                    print(userdata);
                                    client
                                        .auth('/styla/auth/signup', userdata)
                                        .then((response) {
                                      if (response != null) {
                                        print(response);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) => StayScreen(),
                                        //     ));
                                      }
                                    });
                                  });
                                }
                              },
                              child: Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.blueAccent,
                                  color: AppColor.mainColor,
                                  elevation: 7.0,
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40.0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blueAccent,
                                              style: BorderStyle.solid,
                                              width: 1.2),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                              child: ImageIcon(
                                            AssetImage('assets/facebook.png'),
                                            color: Colors.blueAccent,
                                          )),
                                          Center(
                                            child: Text('Login with facebook',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat')),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 40.0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.redAccent,
                                              style: BorderStyle.solid,
                                              width: 1.2),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/google.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Center(
                                            child: Text('Log in with Google',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat')),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account ?',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildRemembermeCb() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.black45,
              ),
              child: Checkbox(
                value: isRememberMe,
                checkColor: AppColor.mainColor,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value;
                  });
                },
              )),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
