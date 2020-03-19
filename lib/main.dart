import 'package:attendance_portal/presentations/splash_page.dart';
import 'package:attendance_portal/store/attendance_store.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(value: UserStore()),
        Provider<AttendanceStore>.value(value: AttendanceStore()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SplashPage(),
        ),
      ),
    );
  }
}
