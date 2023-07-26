import 'package:flutter/material.dart';
import 'package:food_donation/first_page.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  PageController _cont = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _cont,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                  height: 491,
                  width: 490,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/fooddonation.png'),
                      // fit: BoxFit.cover
                    ),
                  )),
              Container(
                  height: 500,
                  width: 500,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/2nd_picture.jpg'),
                        fit: BoxFit.fitWidth),
                  )),
              Container(
                  height: 1000,
                  width: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/4th_picture.jpeg'),
                      // fit: BoxFit.cover
                    ),
                  )),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => First()));
                      },
                      child: Text('Skip',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    SmoothPageIndicator(
                      controller: _cont,
                      count: 3,
                      effect: JumpingDotEffect(
                        activeDotColor: Colors.black,
                        dotColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => First(),
                                  ));
                            },
                            child: Text(
                              'Done',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                        : GestureDetector(
                            onTap: () {
                              _cont.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                            child: Text(
                              'Next',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                  ]))
        ],
      ),
    );
  }
}
