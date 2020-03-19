import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({
    this.onTap,
    this.buttonColor = const Color.fromRGBO(225, 39, 75, 1),
    this.title = 'Continue',
  });

  Function onTap;
  Color buttonColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
