import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/report.dart';
import 'package:food_donation/request_form.dart';
import 'constants.dart';
import 'history_of_donation.dart';
import 'login.dart';
import 'org_registration.dart';
import 'About_us.dart';
import 'Contact.dart';
import 'user_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/home.jpeg'), fit: BoxFit.cover),
              )),
          Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 65, 129, 98)),
                    accountName: Text(box.read('username') ?? "New User"),
                    accountEmail: Text(box.read('email') ?? "No Email Found"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text("Location"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.report_outlined,
                    ),
                    title: const Text("Report"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Report()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text("Apps info"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const About_us()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text("Logout"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Oops!"),
                                content: const Text("Are You Sure?"),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        box.write('state', false);
                                        box.write('username', "New User");
                                        box.write('email', "No Email Found");
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                      },
                                      child: const Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ]);
                          });
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              backgroundColor: const Color.fromARGB(255, 12, 12, 12),
              centerTitle: true,
              title: const Text(
                'Food Donation',
                //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            body: GridView(
              padding: const EdgeInsets.only(top: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  // CrossAxisAlignment.center,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 300),
              children: [
                Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (box.read('state') == true) {
                        await getOrganizationName();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const request_form()));
                      } else if (box.read('state') == null ||
                          box.read('state') == false) {
                        print("fomr");
                        print(box.read('state'));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(34, 255, 255, 255)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 9, 37, 35)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    child: const Text(
                      'Donation',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    child: SizedBox(
                      //height: 200,
                      //width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const org_registration()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(34, 255, 255, 255)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 9, 37, 35)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text(
                          'Organization Registation',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    child: SizedBox(
                      //height: 200,
                      // width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const History()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(34, 255, 255, 255)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 9, 37, 35)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text(
                          'History of Donation',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    child: SizedBox(
                      //height: 200,
                      //width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Contact()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(34, 255, 255, 255)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 9, 37, 35)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text(
                          'Contact',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
