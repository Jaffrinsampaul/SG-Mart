import 'package:flutter/material.dart';
import 'package:sg_mart/login&signin/login.dart';
import 'package:sg_mart/screen/landing_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(25)),
            //   ),
            //   child: Container(
            //     width: Size.width * .40,
            //     height: Size.height * .60,
            //     margin: const EdgeInsets.all(15),
            //     child: Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
            //           child: Text(
            //             "Welcome to Sg Mart",
            //             style: TextStyle(color: Colors.black54, fontSize: 35),
            //           ),
            //         ),
            //         // Padding(
            //         //   padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            //         //   child: Text(
            //         //     "Enter your Correct detail",
            //         //     style: TextStyle(color: Colors.grey, fontSize: 15),
            //         //   ),
            //         // ),
            //         // Padding(
            //         //   padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            //         //   child: Text(
            //         //     "Let's Joined together and grow together",
            //         //     style: TextStyle(color: Colors.grey, fontSize: 15),
            //         //   ),
            //         // ),
            //         Padding(padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            //           child: Text(
            //             "Dress for success.Image is very important. people just you by the way you look on the outsite",
            //             style: TextStyle(color: Colors.grey, fontSize: 15),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              width: Size.width * .60,
              height: Size.height * .80,
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  //LeftSide
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    width: Size.width * .20,
                    height: Size.height * .80,
                    child: Column(
                      children: [
                        //Sgmart text
                        Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Text(
                            "Welcome to Sg Mart",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25, color: Colors.black87),
                          ),
                        ),
                        //Second line
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Dress for Success image is very Important. People "
                            "judge you by the way you look on yhe outside",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  //RightSide
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    width: Size.width * .40,
                    height: Size.height * .80,
                    child: Column(
                      children: [
                        //Signup
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20
                            ),
                          )
                        ),
                        //Phone
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 25, 40, 10),
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
                        //Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name",
                                icon: Icon(Icons.person),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                          ),
                        ),
                        //Email
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
                        //password
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.visibility),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        //referal
                        Padding(padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Referal",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),),
                        //Button
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 25, 40, 5),
                          child: Container(
                            width: double.infinity,
                            child: FloatingActionButton.extended(
                              backgroundColor: Colors.green,
                              label: Text(
                                "Create account",
                                style: TextStyle(),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              },
                            ),
                          ),
                        ),
                        //Login page
                        Padding(
                          padding: const EdgeInsets.fromLTRB(220, 20, 40, 5),
                          child: Row(
                            children: [
                                Center(
                                  child: Text(
                                    "Are you have account?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              SizedBox(
                                width: 6,
                              ),
                              GestureDetector(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.fromLTRB(200, 25, 40, 20),
// child: Row(
// children: [
// Center(
// child: Text(
// "Already have an account?",
// style: TextStyle(color: Colors.grey),
// ),
// ),
// GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Login(),
// ));
// },
// child: Text(
// "Log In",
// style: TextStyle(color: Colors.green),
// ),
// )