import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/home.dart';
import 'constants.dart';

class request_form extends StatefulWidget {
  const request_form({Key? key}) : super(key: key);

  @override
  State<request_form> createState() => _request_formState();
}

class _request_formState extends State<request_form> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController DonornameController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  String dropdownvalue = 'Select Any Organization';

  // List of items in our dropdown menu
  List<String> demoItems = ['Select Any Organization'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Image2.jpg'), fit: BoxFit.cover),
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
                            SizedBox(height: 100),
                            CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Home();
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ))),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Make A Request To ',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Donate Food ',
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          child: DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: DonornameController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^[a-z A-Z]+$');
                            if (!regex.hasMatch(value!)) {
                              return 'Please Enter Your Name';
                            }
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            } else if (value.length < 5) {
                              return "Name must be more than 5 characters";
                            }
                          },
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Donor Name',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Name',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: itemController,
                          validator: (value) {
                            if (value == "") {
                              return "Food Items required";
                            }
                          },
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Food Items',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintText: 'Enter The Food Items',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: quantityController,
                          validator: (value) {
                            RegExp regex = RegExp('(\\+88)?-?01[3-9]\\d{8}');
                            if (!regex.hasMatch(value!)) {
                              return "Only numbers";
                            }
                            if (value!.isEmpty) {
                              return 'Please enter the quantity';
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Quantity',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintText: 'Enter The Quantity Of Food ',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: addressController,
                          validator: (value) {
                            RegExp regex = RegExp(r'^[a-z A-Z]+$');
                            if (!regex.hasMatch(value!)) {
                              return "Only characters";
                            }
                            if (value!.isEmpty) {
                              return 'Please Enter Your location';
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Location',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Address',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: numberController,
                          validator: (value) {
                            //r'^[a-z A-Z]+$'
                            RegExp regex =
                                RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
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
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                backgroundColor: Colors.white),
                            labelText: 'Phone Number',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintText: 'Enter Your Phone Number',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            var name = DonornameController.text.trim();
                            var item = itemController.text.trim();
                            var quantity = quantityController.text.trim();
                            var address = addressController.text.trim();
                            var number = numberController.text.trim();

                            FirebaseFirestore.instance
                                .collection('request data')
                                .doc()
                                .set({
                              "name": name,
                              "items": item,
                              "quantity": quantity,
                              "address": address,
                              "contact": number,
                            });

                            _request();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                          child: (Text("Submit",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white))),
                        ),
                      ],
                    )),
              ))),
    );
  }

  _request() {
    var isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" Your Request Succesfully")));
      print("Submitted");
    } else {
      return;
    }
  }
}
