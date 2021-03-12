import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final tabList = ["Shop", "Promtes", " Start A Business", "About"];
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
                labelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Shop",
                    icon: Icon(Icons.menu, color: Colors.red),
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
        titleSpacing: 200,
        elevation: 0.5,
        title: Text(
          "Sg  Mart",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: GestureDetector(
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            width: size.width * 0.030,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
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
          return Center(child: Text(item));
        }).toList(),
      )
    );
  }
}

// class TestScreen extends StatefulWidget {
//   @override
//   _TestScreenState createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen>
//     with SingleTickerProviderStateMixin {
//   final tabList = ['Tab 1', 'Tab 2'];
//   TabController _tabController;
//
//   @override
//   void initState() {
//     _tabController = TabController(vsync: this, length: tabList.length);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Point Tab Bar'),
//         centerTitle: false,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(kToolbarHeight),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: TabBar(
//               isScrollable: true,
//               controller: _tabController,
//
//               tabs: tabList.map((item) {
//                 return Tab(
//                   text: item,
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: tabList.map((item) {
//           return Center(child: Text(item));
//         }).toList(),
//       ),
//     );
//   }
// }
