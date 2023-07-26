import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  registrationState createState() => registrationState();
}

class registrationState extends State<registration> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _isHidden2 = true;
  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Image4.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: _formkey,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.only(left: 47, top: 7),
              child: Text(
                'Please Create Your Account',
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    right: 35,
                    left: 35),
                child: Column(children: [
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      RegExp regex = RegExp(r'^[a-z A-Z]+$');
                      if (!regex.hasMatch(value!)) {
                        return "Only characters";
                      }
                      if (value.isEmpty) {
                        return 'Please Enter Your location';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Name:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      RegExp regex = RegExp(r'^[a-z0-9]+@[a-z]+.[a-z]+$');
                      if (value!.isEmpty) {
                        return 'Please Enter an email address';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _isHidden,
                    controller: passwordController,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
                      if (value!.isEmpty) {
                        return 'Please Enter The Password';
                      } else if (!regex.hasMatch(value)) {
                        return 'Please enter a proper password';
                      } else if (value.length < 6) {
                        return ("Password Must be more than 5 characters");
                      } else if (!regex.hasMatch(value)) {
                        return ("Password should contain upper,lower,digit and Special character ");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: ' Enter Password:',
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _isHidden2,
                    controller: confirmPasswordController,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter the password';
                      } else if (!regex.hasMatch(value)) {
                        return 'Incorrect Password';
                      }
                      if (value != passwordController.text) {
                        return 'Confimation password does not match the entered password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Confirm Password:',
                      suffix: InkWell(
                        onTap: _togglePasswordView2,
                        child: Icon(
                          _isHidden2 ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: contactController,
                    validator: (value) {
                      RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                      if (value!.isEmpty) {
                        return 'Please enter the phone number';
                      }
                      if (value.length != 11) {
                        return 'Mobile Number must be of 11 digit';
                      } else if (!regex.hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Contact No:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var name = nameController.text.trim();
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();
                      var confirmPassword =
                          confirmPasswordController.text.trim();
                      var contact = contactController.text.trim();

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        final x = FirebaseAuth.instance.currentUser!.uid;
                        FirebaseFirestore.instance
                            .collection('userdata')
                            .doc(x)
                            .set({
                          'name': name,
                          "email": email,
                          "password": password,
                          "confirmpassword": confirmPassword,
                          "contact": contact,
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      });
                      _register();
                    },
                    child: Text('Submit',
                        style: TextStyle(fontSize: 23, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 80,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/google-logo-icon.png'),
                      iconSize: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                      iconSize: 60,
                    )
                  ]),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _register() {
    var isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Succesfully register")));
      //print("Submitted");
    } else {
      return;
    }
  }
}
