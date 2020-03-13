import 'package:attendance_portal/presentations/name_page.dart';
import 'package:attendance_portal/presentations/splash_page.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Attendance Management',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                getCard(
                  cardColor: Colors.deepOrangeAccent,
                  title: 'Record Attendance',
                  prefixIcon: Image.asset(
                    'assets/paper_bg.png',
                    fit: BoxFit.fill,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterNamePage()));
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Provider.of<UserStore>(context).user.isAdmin
                    ? Column(
                        children: <Widget>[
                          getCard(
                            title: 'Calculate Average',
                            cardColor: Colors.blue,
                            prefixIcon: Image.asset(
                              'assets/calculator.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      )
                    : SizedBox(),
                getCard(
                  title: 'Know More',
                  cardColor: Colors.red,
                  prefixIcon: Center(
                    child: Icon(
                      Icons.help_outline,
                      color: Colors.black54,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                getCard(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SplashPage()));
                  },
                  cardColor: Colors.lightGreen,
                  title: 'Settings',
                  prefixIcon: Center(
                    child: Icon(
                      Icons.settings,
                      color: Colors.black54,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getCard({
    Color cardColor,
    Function onTap,
    String title = 'Lorem Ipsum',
    Widget prefixIcon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Container(
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: prefixIcon,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 7,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
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
