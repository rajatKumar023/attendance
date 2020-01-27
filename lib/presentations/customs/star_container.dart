import 'package:flutter/material.dart';

class StarContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 49, 83, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topLeft: Radius.circular(30),
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 49, 83, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(30),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 49, 83, 1),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 49, 83, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}