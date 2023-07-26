import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/home.dart';

class org_registration extends StatefulWidget {
  const org_registration({Key? key}) : super(key: key);

  @override
  org_registrationState createState() => org_registrationState();
}

class org_registrationState extends State<org_registration> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
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
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Image1.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(height: 80),
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Home();
                                          },
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ))),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              'Create An',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              'Account -->',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^[a-z A-Z]+$');
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            } else if (value.length < 5) {
                              return "Name must be more than 5 characters";
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Name',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Name',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Email',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
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
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            labelStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Password',
                            suffix: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
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
                          obscureText: _isHidden2,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            labelStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Confirm Password',
                            suffix: InkWell(
                              onTap: _togglePasswordView2,
                              child: Icon(
                                _isHidden2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Registration Number required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Organization Registration Number',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Registration Number',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: addressController,
                          validator: (value) {
                            if (value == "") {
                              return "Address field can't Empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Address',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Address',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: numberController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^01[3-9]\\d{8}$');
                            //RegExp regex = RegExp(r'(\\+88)?-?01[3-9]\\d{8}');
                            if (value!.isEmpty) {
                              return 'Please enter the phone number';
                            }
                            // if (value.length != 11) {
                            //   return 'Mobile Number must be of 11 digit';
                            // }
                            else if (!regex.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Contact',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Mobile Number',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            var name = nameController.text.trim();
                            var email = emailController.text.trim();
                            var password = passwordController.text.trim();
                            var confirmPassword =
                                confirmPasswordController.text.trim();
                            var contact = numberController.text.trim();
                            var address = addressController.text.trim();

                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password)
                                .then(
                                  (value) => FirebaseFirestore.instance
                                      .collection('org_registration')
                                      .doc(email)
                                      .set({
                                    "name": name,
                                    "email": email,
                                    "password": password,
                                    "confirmpassword": confirmPassword,
                                    "contact": contact,
                                    "address": address,
                                  }),
                                );
                            _register();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: (const Text("Register",
                              style: TextStyle(
                                  fontSize: 23, color: Colors.white))),
                        ),
                      ],
                    )),
              ))),
    );
  }

  _register() {
    var isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Succfully organization register")));
      //print("Submitted");
    } else {
      return;
    }
  }
}
