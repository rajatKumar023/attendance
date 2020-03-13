import 'package:attendance_portal/presentations/customs/star_container.dart';
import 'package:attendance_portal/presentations/login/sign_in_page.dart';
import 'package:attendance_portal/presentations/login/sign_up/details_enter_page.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 35,
                    left: 35,
                    child: StarContainer(),
                  ),
                ],
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    bottomLeft: Radius.circular(80.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
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
                            'Create Account',
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
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
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
                            decoration: InputDecoration(
                              hintText: 'Password',
                            ),
                          ),
                          SizedBox(
                            height: 80.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  mAuth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password)
                                      .then((AuthResult authResult) {
                                    Provider.of<UserStore>(context)
                                        .setLoggedInUser(authResult.user);
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return EnterDetailsPage();
                                        },
                                        transitionsBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
                                                Widget child) {
                                          return SlideTransition(
                                            position: new Tween<Offset>(
                                              begin: const Offset(1.0, 0.0),
                                              end: Offset.zero,
                                            ).animate(animation),
                                            child: new SlideTransition(
                                              position: new Tween<Offset>(
                                                begin: Offset.zero,
                                                end: const Offset(-1.0, 0.0),
                                              ).animate(secondaryAnimation),
                                              child: child,
                                            ),
                                          );
                                        },
                                      ),
                                    );
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
                                      builder: (context) => SignInPage()));
                            },
                            child: Text(
                              'I already have an account',
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
