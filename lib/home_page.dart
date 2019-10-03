import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/sections.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name, id, totalStudents, presentStudents, subSection;
  Section section;
  List<String> csList = ['CS1', 'CS2', 'CS3'];
  List<String> itList = ['IT1', 'IT2'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Form(
          onChanged: () => _formKey.currentState.validate(),
          key: _formKey,
          autovalidate: false,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value;
                    },
                    onEditingComplete: () => _formKey.currentState.validate(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of Faculty'),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      id = value;
                    },
                    onEditingComplete: () => _formKey.currentState.validate(),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Id',
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Department:',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DropdownButtonFormField<Section>(
                              items: Section.values
                                  .toList()
                                  .map(
                                    (Section g) => DropdownMenuItem(
                                      value: g,
                                      child: Text(
                                        Section.displayValue(g),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Section:',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      totalStudents = value;
                    },
                    onEditingComplete: () => _formKey.currentState.validate(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Total no. of students',
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      presentStudents = value;
                    },
                    onEditingComplete: () => _formKey.currentState.validate(),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                    ],
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No. of students present',
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                      child: Container(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
