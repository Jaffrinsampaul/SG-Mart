import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User_Detail extends StatefulWidget {
  @override
  _User_DetailState createState() => _User_DetailState();
}

class _User_DetailState extends State<User_Detail> {
  List<String> name = List();
  List<Widget> pname = List();

  Uri url;
  TextEditingController Commission = TextEditingController();
  TextEditingController pnamecon = TextEditingController();
  // String Commission;

  // Future getPost() async {
  //   var firestore = FirebaseFirestore.instance;
  //   QuerySnapshot qn = await firestore.collection('Users').where('name',isNotEqualTo: null).get();
  //
  //   return qn.docs;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'asset/sgmart.png',
          height: 82,
          width: 82,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('Users')
              .orderBy('name')
              .get(),
          builder: (_, snapshot) {
            //Before data display
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading....."),
              );
            } else {
              //Gridview return card return listtile
              return GridView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        title: Text(
                          snapshot.data.docs[index].get("name"),
                        ),
                        subtitle: Text(
                          snapshot.data.docs[index].get('phone'),
                        ),
                        trailing: IconButton(
                          splashColor: Colors.green,

                          onPressed: () {
                            Diaglog();
                            // FirebaseFirestore.instance
                            //     .collection("Products")
                            //     .doc("commission")
                            //     .set({'name': 'Auugtin'});
                          },
                          // onPressed: () =>
                          //     onpressed(
                          //         'Add purchase detail',
                          //         'Price'),
                          icon: Icon(
                            Icons.menu,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  },
                  //Size for Grid view
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 2)));
            }
          },
        ),
      ),
    );
  }

  Diaglog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter stateSetter) {
            return Dialog(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /1.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: Commission,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: "Purhase"),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 9,
                      // ),
                      Container(
                        child: Image.asset("asset/sgmart.png"),
                      )
                    ],
                  ),
                  RaisedButton(onPressed: (){
                    FirebaseFirestore.instance
                        .collection("User")
                        .doc()
                        .set({"Commission":"2000"});

                  },child: Text(
                    "sent"
                  ),
                  )
                ],
              ),
            ));
          });
        });
  }
}

// onpressed(title, dname) {
//   final size = MediaQuery
//       .of(context)
//       .size;
//   showDialog(context: context, builder: (context) {
//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter stateSetter) {
//         return Dialog(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text(
//                       title, style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       width: size.width / 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: TextFormField(
//                             controller: pnamecon,
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(12.0)),
//                                 hintText: 'Price')
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () =>
//                             uploadToStorage(
//                                 fileName: dname,
//                                 pathName: 'products/$dname',
//                                 updateState: stateSetter)),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: RaisedButton(
//                             color: Colors.green,
//                             onPressed: () async {
//                               print(Commission);
//                               name.add(pnamecon.text);
//                               Commission != null
//                                   ? name.add(Commission)
//                                   : print('Null Value');
//                               print('Controller : ${pnamecon.text}');
//                               print(name);
//                               await FirebaseFirestore.instance
//                                   .collection('Products')
//                                   .doc(dname)
//                                   .set(
//                                 {
//                                   '': FieldValue.arrayUnion(name),
//                                 },
//                                 SetOptions(merge: true),
//                               );
//                               name.clear();
//                               pname.clear();
//                               pnamecon.clear();
//                               setState(() {
//                                 Commission = null;
//                               });
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               'Save',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                         //Cancel button
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: RaisedButton(
//                             color: Colors.green,
//                             onPressed: () {
//                               name.clear();
//                               pname.clear();
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               'Cancel',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   });
// }

//   uploadToStorage({fileName, String pathName, StateSetter updateState}) {}
//
//   updated(StateSetter updateState) {
//     updateState(() {
//       pname.add(
//         Expanded(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   onChanged: (value) {
//                     setState(() {
//                       Commission = value;
//                     });
//                   },
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12.0)),
//                       hintText: 'Name'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//       setState(() {});
//     });
//   }
// }
