// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;

  const Category({
    Key? key,
    required this.icon,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}


