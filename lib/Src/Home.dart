import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showapp/Src/Card.dart';
import 'package:showapp/data.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double current_page;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    controller.addListener(() {
      setState(() {
        current_page = controller.page;

        //print("Pageeee ${controller.page}");
      });
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: MediaQuery.of(context).size.width / 3,
                  top: 50,
                  child: Stack(
                    children: <Widget>[
                      Transform(
                          transform: Matrix4.translationValues(
                              current_page == null
                                  ? 0.0
                                  : -(current_page * 200),
                              0.0,
                              0.0),
                          child: CardView(current_page))
                    ],
                  )),
              Positioned.fill(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  itemCount: image_list.length,
                  controller: controller,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return Container(
                        //color: index % 2 == 0 ? Colors.orange : Colors.black,
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  double currentPage;

  CardView(this.currentPage);

  List<Widget> cardList = new List();

  @override
  Widget build(BuildContext context) {
    ///   print(widget.currentPage);

    for (int i = 0; i < image_list.length; i++) {
      /// print("Widdddddddddddddddddddddddddddddddd  ${widget.currentPage}");

      Widget card = ShowCard(i, currentPage);

      cardList.add(card);
    }

    return Row(
      children: cardList,
    );
  }
}
