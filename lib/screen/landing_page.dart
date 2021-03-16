import 'package:flutter/material.dart';
import 'package:sg_mart/login&signin/login.dart';
import 'package:sg_mart/login&signin/new_account.dart';
import 'package:sg_mart/screen/pages/about.dart';
import 'package:sg_mart/screen/pages/onbording.dart';
import 'package:sg_mart/screen/pages/promotion.dart';
import 'package:sg_mart/screen/pages/start_a_business.dart';
import 'package:tabbar/tabbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  final tabList = [Onbording(), Home(), Promotion(),  About(), Business()];
  TabController _tabController;



@override
void initState() {
  _tabController = TabController(vsync: this, length: tabList.length);
  super.initState();
}

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: [
                  //Home
                  Tab(
                    text: "Home",
                  ),
                  //Shop
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .020,
                      ),
                      Tab(
                        icon: Icon(Icons.menu, color: Colors.red,textDirection: TextDirection.ltr,),
                      ),
                      SizedBox(
                        width: size.width * 0.020,
                      ),
                      Text("Shop")
                    ],
                  ),
                  Tab(text: "Promotion",),
                  Tab(text: "About Sg Mart",),
                  Tab(text: "Start A Business",),
                ],
                // tabs: tabList.map((item) {
                //   return Tab(
                //     text: item,
                //   );
                // }).toList(),
              ),
            ),
          ),
        backgroundColor: Colors.white,
        // titleSpacing: 200,
        elevation: 0.5,
        title: Text(
          "Sg  Mart",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          //Signin
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              },
            ),
          ),
          SizedBox(
            width: size.width * 0.030,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              child: Text(
                "Registor",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup(),));
              },
            ),
          ),
          //Registor
          SizedBox(
            width: size.width * 0.030,
          ),
          //cart
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                color: Colors.black,
                onPressed: () {
                  // Navigator.pop(context);
                }),
          ),
          SizedBox(
            width: size.width * 0.020,
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: SizedBox(
      //     width: size.width * 0.10,
      //     child: Column(
      //       children: [
      //         Container(
      //           child: Row(
      //             children: [
      //               GestureDetector(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 100.0),
      //                   child: Row(
      //                     children: [
      //                       IconButton(
      //                           icon: Icon(Icons.menu),
      //                           color: Colors.red,
      //                           onPressed: () {}),
      //                       Text(
      //                         "Shop",
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: size.width * 0.020,
      //               ),
      //               GestureDetector(
      //                 child: Text(
      //                   "Promotion",
      //                   style: TextStyle(),
      //                 ),
      //                 onTap: () {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => Promotion(),
      //                       ));
      //                 },
      //               ),
      //               SizedBox(
      //                 width: size.width * 0.020,
      //               ),
      //               GestureDetector(
      //                 child: Text("About  Sg Mart"),
      //                 onTap: () {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => About(),
      //                       ));
      //                 },
      //               ),
      //               SizedBox(
      //                 width: size.width * 0.020,
      //               ),
      //               GestureDetector(
      //                 child: Text("Start A Bussiness"),
      //                 onTap: () {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => Business(),
      //                       ));
      //                 },
      //               )
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: TabBarView(
        controller: _tabController,
        children: tabList.map((item) {
          return Center(
          );
        }).toList(),
      )

    );
  }
}

