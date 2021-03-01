import 'package:flutter/material.dart';
import 'package:library_system/export.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Function onDoubleTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap, this.onDoubleTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: sixthColor,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: fourthColor),
            )
          ],
        ),
      ),
    );
  }
}
