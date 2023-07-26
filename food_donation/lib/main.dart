import 'package:flutter/material.dart';
import 'package:food_donation/start_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: Home(),
      home: Start(),
      //home : history_of_donation(),
      // home: Login(),
      //home: Registration(),
      //home: org_registration(),
      // home: request_form(),
      //home: start_page(),
      //home: Contact(),
    );
  }
}
