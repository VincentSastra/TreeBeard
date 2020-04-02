import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight = 60.0;
  final double preferredMargins = 20.0;
  final Widget centerIcon = Icon(Icons.landscape);

  Color barColor;
  Widget leftChild;
  Widget rightChild;

  CustomAppBar(this.leftChild, this.rightChild, this.barColor);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: barColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Container(
        height: preferredHeight,
        color: barColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Align(
                    alignment: Alignment(-0.5,0),
                    child: leftChild)),
            Expanded(
              child: Center(
                  child: centerIcon),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment(0.5, 0),
                  child: rightChild),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}

