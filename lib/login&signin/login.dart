import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sg_mart/login&signin/new_account.dart';
import 'package:sg_mart/screen/landing_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Container(
                width: Size.width * .40,
                height: Size.height * .60,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
                      child: Text(
                        "Welcome To Sg Mart",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 45,
                            fontFamily: "Redress-Regular",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Size.height * .020,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                      child: Text(
                        "The Richest Pepole In The World Looks For And Build Networks, "
                        "Everyone Else looks For Work",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            "Manage Your Bussiness Account",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Container(
                width: Size.width * .40,
                height: Size.height * .60,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Login here",
                        style: TextStyle(color: Colors.black54, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            icon: Icon(Icons.phone),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Email id",
                            icon: Icon(Icons.email_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          icon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                      child: Container(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          },
                          child: FloatingActionButton.extended(
                            backgroundColor: Colors.green,
                            label: Text(
                              "Login",
                              style: TextStyle(),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ));
                        },
                        child: Text(
                          "Dont't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
