import 'dart:math';

import 'package:attendance_portal/models/user.dart';
import 'package:attendance_portal/presentations/customs/star_container.dart';
import 'package:attendance_portal/presentations/home.dart';
import 'package:attendance_portal/services/preference_service.dart';
import 'package:attendance_portal/services/user_service.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class EnterDetailsPage extends StatefulWidget {
  EnterDetailsPage({
    @required this.firebaseUser,
  });

  final FirebaseUser firebaseUser;

  @override
  _EnterDetailsPageState createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  String name;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast.show(
        'Signed up successfully',
        context,
      );
    });
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
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    top: 35,
                    right: 35,
                    child: StarContainer(),
                  ),
                ],
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
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
                            'Enter Name',
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
                                name = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Name',
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
                                'Continue',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Random random = Random();
                                  int id = random.nextInt(100000);
                                  User user = User.fromJson({
                                    'name': name,
                                    'id': id,
                                    'email': widget.firebaseUser.email,
                                    'isAdmin': false,
                                  });
                                  UserService.getInstance()
                                      .addUser(User.toJson(user),
                                          widget.firebaseUser.email)
                                      .then((value) {
                                    PreferencesService.getInstance()
                                        .setAuthUser(user);
                                    Provider.of<UserStore>(context)
                                        .setLoggedInUser(user);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
