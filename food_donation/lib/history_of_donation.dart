import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text(
            'History',
            style: TextStyle(
                backgroundColor: Colors.teal,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('request data') //to  fetch database
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 15, bottom: 15),
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        var data = snapshot.data!.docs[i];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 196, 211, 197),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(
                                  left: 30, top: 10, bottom: 10, right: 30),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(data['items']),
                                        const SizedBox(height: 6),
                                        Text(data['quantity']),
                                        const SizedBox(height: 6),
                                        Text(data['address']),
                                      ],
                                    ),
                                  ]),
                            ),
                            const SizedBox(height: 15)
                          ],
                        );
                      }),
                );
              }
              return const CircularProgressIndicator();
            }));
  }
}
