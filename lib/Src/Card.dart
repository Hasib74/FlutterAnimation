import 'package:flutter/material.dart';

import '../data.dart';
import 'dart:math' as math;

class ShowCard extends StatefulWidget {
  final i;

  double current_page;

  ShowCard(this.i, this.current_page);

  @override
  _ShowCardState createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard>
    with SingleTickerProviderStateMixin {
  // Animation<double> animationShows;
  /* Animation<double> animationCard;

  AnimationController controller;*/

  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*   controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    */ /* animationShows = Tween<double>(begin: 100, end: 70).animate(controller)
      ..addListener(() {
        setState(() {});
      });
*/ /*
    animationCard = Tween<double>(begin: 0.3, end: 0).animate(controller);*/

    //  controller.forward();

    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.4, end: 0).animate(_arrowAnimationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _arrowAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var page = int.parse(widget.current_page.toString());

    // print(page);

    /*
    *    transform: Matrix4.identity()
         ..setEntry(3, 2, 0.002)
        ..rotateY( 0.3)
        ..rotateX(0)
        ..rotateZ(0),
    *
    * */

    return Column(
      children: <Widget>[


        Stack(
          children: <Widget>[



            AnimatedBuilder(
                animation: _arrowAnimationController,
                builder: (context, child) {


                  if (widget.i == 0 || widget.current_page == null) {

                  } else {
                    if (widget.current_page < (widget.i - (0.2))) {


                      _arrowAnimationController.reverse();



                    } else {

                      _arrowAnimationController.forward();

                    }
                  }

                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateY(0)
                      ..rotateX(0)
                      ..rotateZ(0),
                    origin: Offset.zero,
                    alignment: Alignment.center,
                    child: new Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 55),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: color_code[widget.i],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ]),
                            child: Column(
                              children: <Widget>[
                                new Text(
                                  "I am Hasib Akon",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  );

                }/*Transform.rotate(
                  angle: _arrowAnimation.value,
                  child: Icon(
                    Icons.expand_more,
                    size: 50.0,
                    color: Colors.black,
                  ),
                ),*/
            ),
            show(widget.current_page, widget.i),

          ],
        )

      ],
    );
  }

  show(double current_page, i) {
    double padding = 110;

    print("Current Page...................  ${current_page}");

    if (i == 0 || current_page == null) {
      setState(() {
        padding = 70;
      });
    } else {
      if (current_page < (i - (0.2))) {
        setState(() {
          padding = 110;
        });
      } else {
        setState(() {
          padding = 70;
        });
      }
    }

    return Positioned(
      bottom: 25,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        padding: EdgeInsets.only(left: padding),
        child: Container(
          height: 110,
          width: 110,
          child: Image.asset(
            image_list[widget.i],
          ),
        ),
      ),
    );
  }
}


/*
*
*  show(widget.current_page, widget.i),
* */