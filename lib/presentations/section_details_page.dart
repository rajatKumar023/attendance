import 'package:attendance_portal/models/attendance.dart';
import 'package:attendance_portal/presentations/customs/floating_button.dart';
import 'package:attendance_portal/store/attendance_store.dart';
import 'package:attendance_portal/store/user_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionDetailsPage extends StatefulWidget {
  @override
  _SectionDetailsPageState createState() => _SectionDetailsPageState();
}

class _SectionDetailsPageState extends State<SectionDetailsPage> {
  Section section;
  String subSection;
  List<String> csList = ['CS1', 'CS2', 'CS3'];
  List<String> itList = ['IT1', 'IT2'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
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
                              'Enter the section details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            DropdownButtonFormField<Section>(
                              items: Section.values
                                  .toList()
                                  .map(
                                    (Section g) => DropdownMenuItem(
                                      value: g,
                                      child: Text(
                                        describeEnum(g),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: section,
                              validator: (Section section) {
                                if (section == null) {
                                  return 'This field is required';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (Section newValue) {
                                setState(() {
                                  section = newValue;
                                });
                              },
                            ),
                            DropdownButtonFormField<String>(
                              items: section == Section.CS
                                  ? csList
                                      .toList()
                                      .map(
                                        (g) => DropdownMenuItem(
                                          value: g,
                                          child: Text(
                                            g,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : section == Section.IT
                                      ? itList
                                          .toList()
                                          .map(
                                            (g) => DropdownMenuItem(
                                              value: g,
                                              child: Text(
                                                g,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList()
                                      : null,
                              value: subSection,
                              validator: (value) {
                                if (value == null) {
                                  return 'This field is required';
                                }

                                if (section == null) {
                                  return 'Please select a section first';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  subSection = newValue;
                                });
                              },
                            ),
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
                buttonColor: Colors.lightGreen,
                title: 'Submit',
                onTap: () {
                  if (section != null && subSection != null) {
                    Provider.of<AttendanceStore>(context)
                        .setSectionForAttendance(section);
                    Provider.of<AttendanceStore>(context)
                        .setSubSectionForAttendance(_getSubSection(subSection));

                    ///CODE FOR SUBMISSION
                    Provider.of<AttendanceStore>(context).submitAttendance(
                        Provider.of<UserStore>(context).user.email);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getSubSection(String sub) {
    SubSection subSectionValue;
    SubSection.values.forEach((SubSection subSection) {
      if (sub == describeEnum(subSection)) {
        subSectionValue = subSection;
      }
    });
    return subSectionValue;
  }
}
