import 'package:flutter/material.dart';

class TestAnimation extends StatefulWidget {
  @override
  _TestAnimationState createState() => _TestAnimationState();
}

class _TestAnimationState extends State<TestAnimation> {
 /* EdgeInsetsGeometry _padding = EdgeInsets.zero;
  void _changePadding() {
    setState(() {
      if (_padding == 100) {
        _padding = EdgeInsets.only(top: 100, bottom: 100);
      } else {
        _padding = EdgeInsets.only(left: 100, right: 100);
      }
    });
  }
*/

  double _padding=0;


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column(

          children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              child: AnimatedPadding(
                padding: EdgeInsets.all(_padding),
                curve: Curves.ease,
                duration: Duration(seconds: 1),
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),


            Expanded(
              child: InkWell(
                onTap: () {

                  setState(() {

                    if(_padding == 0){
                      _padding = 100;
                    }else{

                      _padding = 0;

                    }

                  });

                },
                child: Text(
                  "Click Me!",
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

