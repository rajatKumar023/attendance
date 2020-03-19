import 'package:attendance_portal/presentations/customs/floating_button.dart';
import 'package:attendance_portal/store/attendance_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalStudentsPage extends StatefulWidget {
  @override
  _TotalStudentsPageState createState() => _TotalStudentsPageState();
}

class _TotalStudentsPageState extends State<TotalStudentsPage> {
  String totalStudents;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.red],
              begin: Alignment.topLeft,
            ),
          ),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Enter the total number of students',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            TextFormField(
                              autovalidate: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field cannot be Empty';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  totalStudents = value;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow),
                                ),
                                errorStyle: TextStyle(color: Colors.yellow),
                              ),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ),
              FloatingButton(
                buttonColor: Colors.amber,
                onTap: () {
                  Provider.of<AttendanceStore>(context)
                      .setTotalStudentsForAttendance(totalStudents);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
