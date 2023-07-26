import 'package:cloud_firestore/cloud_firestore.dart';

List<String> items = ['Select Any Organization'];
Future getOrganizationName() async {
  var snapshot = await FirebaseFirestore.instance
      .collection('org_registration')
      .get(); //var = any type will be accept
  for (int i = 0; i < snapshot.docs.length; i++) {
    items.add(snapshot.docs[i].data()['name']);
  }
}
