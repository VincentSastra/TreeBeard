import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight = 60.0;
  final double preferredMargins = 20.0;
  final Widget centerIcon = Icon(Icons.landscape);
  final Color barColor = Colors.greenAccent;

  Widget leftChild;

  CustomAppBar(this.leftChild) : assert(leftChild != null);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
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
              child: Center(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
