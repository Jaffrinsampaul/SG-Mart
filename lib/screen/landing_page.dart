import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgmart/auth.dart';
import 'package:sgmart/home.dart';
import 'package:sgmart/login&signin/login.dart';
import 'package:sgmart/login&signin/new_account.dart';
import 'package:sgmart/screen/pages/about.dart';
import 'package:sgmart/screen/pages/home.dart';
import 'package:sgmart/screen/pages/promotion.dart';
import 'package:sgmart/constants.dart';

class Home extends StatefulWidget {
  final user;
  final  state;
  Home({this.user, this.state});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        // leading: Image.asset('asset/sgmart.png',),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicatorColor: kPrimaryColor,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                //home & icon
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .070,
                    ),
                    Tab(
                      icon: Icon(Icons.home_outlined, color: kPrimaryColor),
                    ),
                    SizedBox(
                      width: size.width * .010,
                    ),
                    Text("Home"),
                  ],
                ),
                //promtion
                // Tab(
                //   text: "Promotion",
                // ),
                //About
                Tab(
                  text: "About Sg Mart",
                ),
                //Business
                Tab(
                  text: "Start A Business",
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        // titleSpacing: 200,
        elevation: 0.5,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 18),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'asset/sgmart.png',
                    height: 82,
                    width: 82,
                  )),
            ),
            // Text(
            //   "SG Mart",
            //   style: TextStyle(fontSize: 20, color: Colors.black),
            // ),
          ],
        ),
        actions: [
          // FirebaseAuth.instance.currentUser == null
              //Signin
          //     ? Padding(
          //         padding: const EdgeInsets.only(top: 18.0),
          //         child: GestureDetector(
          //           child: Text(
          //             "Sign in",
          //             style: TextStyle(color: Colors.black),
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => Login(),
          //               ),
          //             );
          //           },
          //         ),
          //       )
          //     : Container(),
          // SizedBox(
          //   width: size.width * 0.030,
          // ),
          FirebaseAuth.instance.currentUser == null
              //Registation
              ? Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: GestureDetector(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signup(),
                        ),
                      );
                    },
                  ),
                )
              //Signout
              : Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: GestureDetector(
                    child: Text(
                      "SignOut",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      AuthService().signOut(context);
                    },
                  ),
                ),
          SizedBox(
            width: size.width * 0.030,
          ),
          //Cart icon
          // Padding(
          //   padding: const EdgeInsets.only(top: 0.0),
          //   child: IconButton(
          //       icon: Icon(
          //         Icons.shopping_cart_outlined,
          //         color: kPrimaryColor,
          //       ),
          //       color: Colors.black,
          //       onPressed: () {
          //         // Navigator.pop(context);
          //       }),
          // ),
          SizedBox(
            width: size.width * 0.020,
          ),
        ],
      ),
      // body: widget.state,
      body: buildTabBarView(),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        ShopHome(),
        // Promotion(),
        About(),
        FirebaseAuth.instance.currentUser == null
            ? Center(
                child: Text('Please Sign in To Continue'),
              )
            : UserHomePage(
                user: widget.user,
              )
      ],
    );
  }
}

//buttom container called in every page
class Buttom_Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          //Title
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "South Gate Malligai",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(
            height: size.height * .020,
          ),
          //Address first line
          Text(
            "1A, Chidambara Nagar, 1st Street, Opp. Shakthi",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: size.width * .005,
          ),
          //Address second line
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Vinayagar School, Thoothukudi-628008",
                  style: TextStyle(color: Colors.white))),
          SizedBox(
            height: size.height * .020,
          ),
          //custome mail
          MediaQuery.of(context).size.width >= 600? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //email customer
              Container(
                  child: Column(
                children: [
                  Text(
                    "Customer Services",
                    style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(
                    height: size.height * .010,
                  ),
                  Text(
                    "customercare@sgmart.co.in",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              )),
              SizedBox(
                width: size.width * .030,
              ),
              //Media email
              Container(
                child: Column(
                  children: [
                    Text(
                      "Media Relations",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * .010,
                    ),
                    Text(
                      "media@sgmart.co.in",
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width * .030,
              ),
              //Vendor email
              Container(
                child: Column(
                  children: [
                    Text(
                      "Vendor Support",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * .010,
                    ),
                    Text(
                      "vendorsupport@sgmart.co.in",
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ):Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //email customer
              Container(
                  child: Column(
                    children: [
                      Text(
                        "Customer Services",
                        style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        height: size.height * .010,
                      ),
                      Text(
                        "customercare@sgmart.co.in",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  )),
              SizedBox(
                width: size.width * .030,
              ),
              //Media email
              Container(
                child: Column(
                  children: [
                    Text(
                      "Media Relations",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * .010,
                    ),
                    Text(
                      "media@sgmart.co.in",
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width * .030,
              ),
              //Vendor email
              Container(
                child: Column(
                  children: [
                    Text(
                      "Vendor Support",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * .010,
                    ),
                    Text(
                      "vendorsupport@sgmart.co.in",
                      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .030,
          )
        ],
      ),
    );
  }
}
