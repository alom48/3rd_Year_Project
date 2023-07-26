import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/home.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);
  @override
  State<Report> createState() => _ReportState();
}

final TextEditingController reportController = TextEditingController();

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          //elevation: 0.0,
          backgroundColor: Colors.black87,
          centerTitle: true,
          title: const Text(
            'Report',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(height: 20),
                    Text(
                      'Please let us know \nWhat problems are you facing?',
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: reportController,
                      style: TextStyle(fontSize: 18),
                      maxLines: 80,
                      minLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        hintText: 'Write your problems',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var report = reportController.text.trim();
                        FirebaseFirestore.instance
                            .collection('report')
                            .doc()
                            .set({
                          "problems": report,
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: (Text("Submit",
                          style: TextStyle(fontSize: 23, color: Colors.white))),
                    ),
                  ]))),
        ),
      ),
    );
  }
}
