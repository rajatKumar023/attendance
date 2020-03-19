import 'package:attendance_portal/presentations/customs/floating_button.dart';
import 'package:attendance_portal/presentations/total_students_page.dart';
import 'package:attendance_portal/store/attendance_store.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterNamePage extends StatefulWidget {
  @override
  _EnterNamePageState createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                              'Hi there,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Please enter your name to continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Form(
                              key: _formKey,
                              child: TextFormField(
                                initialValue: Provider.of<UserStore>(context)
                                    .user
                                    .name
                                    .toString(),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Name cannot be Empty';
                                  }
                                  if (value.length < 3) {
                                    return 'Name should be greater than 2 characters';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
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
                              ),
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
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    Provider.of<AttendanceStore>(context)
                        .setNameForAttendance(name);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TotalStudentsPage()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
