import 'package:attendance_portal/models/user.dart';
import 'package:attendance_portal/presentations/customs/star_container.dart';
import 'package:attendance_portal/presentations/home.dart';
import 'package:attendance_portal/presentations/login/sign_up/sign_up_page.dart';
import 'package:attendance_portal/services/user_service.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FirebaseAuth mAuth;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    mAuth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(254, 174, 165, 1),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                      ),
                    ),
                  ),
                  Container(
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(164, 119, 175, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 35,
                    child: StarContainer(),
                  )
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                mAuth
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((AuthResult result) {
                                  UserService.getInstance()
                                      .getUser(result.user.email)
                                      .then((DocumentSnapshot response) {
                                    Provider.of<UserStore>(context)
                                        .setLoggedInUser(
                                            User.fromJson(response.data));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  });
                                }).catchError((error) {
                                  Toast.show(
                                    error.message,
                                    context,
                                    duration: 5,
                                  );
                                });
                              },
                              child: Container(
                                height: 60.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(55, 49, 83, 1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            'I don\'t have an account',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
