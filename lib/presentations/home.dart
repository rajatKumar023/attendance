import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: getCard(
                      color: Colors.purple,
                      cardColor: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: getCard(
                      color: Colors.red,
                      cardColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: getCard(
                      color: Colors.green,
                      cardColor: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: getCard(
                      color: Colors.deepOrangeAccent,
                      cardColor: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard({Color cardColor, Color color}) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 18,
      child: Container(
        height: 180.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [cardColor, color], begin: Alignment.topLeft),
        ),
        child: Center(
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
