import 'package:flutter/material.dart';
import 'package:food_donation/home.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 491,
        width: 490,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/3rd_picture.jpg'), fit: BoxFit.fill),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Welcome To',
                      style: TextStyle(fontSize: 44, color: Colors.black),
                    ),
                    Text(
                      'Food Donation',
                      style: TextStyle(
                          fontSize: 44,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '#Save Lives Feed Families',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 450,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  child: (Text("~~~ Let's Start ~~~",
                      style: TextStyle(fontSize: 25, color: Colors.white))),
                ),
              ]),
            ))));
  }
}
