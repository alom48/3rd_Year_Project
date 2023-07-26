import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _Contact();
}

class _Contact extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: const Text('Contact',
              style: TextStyle(
                  //backgroundColor: Colors.,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('org_registration')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              print("Data: $snapshot.data");
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
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.cyan[200],
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(
                                  left: 30, top: 10, bottom: 10, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['name'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(data['contact'])
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _makeCall(data['contact']);
                                      },
                                      icon: const Icon(Icons.call))
                                ],
                              ),
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

  _makeCall(String contact) async {
    var url = Uri.parse("tel:$contact");
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Number Can't Be Dialled")));
      }
      // ignore: empty_catches
    } on Exception {}
  }
}
