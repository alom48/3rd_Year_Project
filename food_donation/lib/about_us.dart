import 'package:flutter/material.dart';

// ignore: camel_case_types
class About_us extends StatefulWidget {
  const About_us({super.key});

  @override
  State<About_us> createState() => About_usState();
}

// ignore: camel_case_types
class About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text('Apps info',
              style: TextStyle(
                  //backgroundColor: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Column(
              children: const [
                Text(
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    "This FOOD DONATION App is an android based app. This app is designed for any random user who’s willing to donate and has no proper chance or time to donate the food to orphanages, old-age homes and foodless people. This application includes the history, status of donation and profiles of the donor, receiver and volunteer.\n\nThis android application uses the information given by the donors. First, those who want to donate food have to register by filling the registration form and choosing the NGO they want to donate to.Our mission is to create a community that is free of hunger and food insecurity.\n\nOur mission is to create a community that is free of hunger and food insecurity. \n"),
                Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    "Version 1.0.0"),
              ],
            ),
          ),
        ));
  }
}
