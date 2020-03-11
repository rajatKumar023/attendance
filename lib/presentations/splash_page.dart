import 'package:attendance_portal/presentations/home.dart';
import 'package:attendance_portal/presentations/login/sign_in_page.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  FirebaseAuth auth;

  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToMainPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
    );
  }

  _navigateToMainPage(BuildContext context) {
    auth.currentUser().then((FirebaseUser user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      } else {
        Provider.of<UserStore>(context).setLoggedInUser(user);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }
}
