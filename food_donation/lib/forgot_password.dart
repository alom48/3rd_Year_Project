import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => ForgotpasswordState();
}

class ForgotpasswordState extends State<Forgotpassword> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Reset Password',
            style: TextStyle(
                // backgroundColor: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/password.jpg'), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Recived an email to reset your password',
                  style: TextStyle(fontSize: 20),
                )),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              // validator :(email) =>
              // email != null && !Email
            ),
            ElevatedButton(
              onPressed: passwordReset,
              child: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
              ),
            ),
          ])),
    );
  }
}
