import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_treeview/dynamic_treeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sgmart/auth.dart';
import 'package:sgmart/login&signin/login.dart';
import 'package:sgmart/main.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sgmart/constants.dart';
import 'package:sgmart/widgets/treeview.dart';

class UserHomePage extends StatefulWidget {
  final user;
  UserHomePage({this.user});
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var globalVolume = 0;
  // User user;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   user = FirebaseAuth.instance.currentUser;
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(widget.user)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print(widget.user);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  var data = snapshot.data;
                  return Row(
                    children: [
                      Container(
                        height: size.height * 0.85,
                        width: size.width * 0.6,
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //Starting letter for login user
                                    CircleAvatar(
                                      backgroundColor: kPrimaryColor,
                                      child: Text(
                                          data
                                              .get('name')
                                              .toString()
                                              .substring(0, 1),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: Colors.white)),
                                    ),
                                    Text('${data.get('name')} \n ${data.get('address')}'),
                                    Text('₹ ${data.get('groupVolume')} \nPaid to you'),
                                    Text('₹ ${data.get('Commission')}\nCommission'),
                                    Text('${data.get('phone')} \n your referal id'),
                                    //clipboard
                                    kIsWeb
                                        ? IconButton(
                                            icon: Icon(Icons.copy,color: Colors.green,),
                                            onPressed: () {
                                              Clipboard.setData(
                                                new ClipboardData(
                                                    text: data.get('phone')),
                                              ).then((result) {
                                                final snackBar = SnackBar(
                                                  content: Text(
                                                      'Copied to Clipboard'),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    textColor: Colors.yellow,
                                                    onPressed: () {},
                                                  ),
                                                );
                                                _scaffoldKey.currentState
                                                    .showSnackBar(snackBar);
                                              });
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.share),
                                            onPressed: () {
                                              FlutterShareMe().shareToSystem(
                                                  msg: data.get('phone'));
                                            },
                                          )
                                  ],
                                ),
                              ),
                              //Your referal
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Your Referals',
                                      style: Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ],
                              ),
                              //data fetching
                              FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('Users')
                                    .where('id',
                                        isGreaterThanOrEqualTo:
                                            '${snapshot.data.get('id')}')
                                    .where('id',
                                        isLessThanOrEqualTo:
                                            '${snapshot.data.get('id')}~')
                                    // .orderBy('level')
                                    // .where('parent', isEqualTo: false)
                                    .get(),
                                builder: (context, snapshot1) {
                                  if (!snapshot1.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot1.data.docs.length,
                                      itemBuilder: (context, index) {
                                        globalVolume += snapshot1.data.docs[index].get('personalVolume');
                                        GestureDetector(
                                          onTap: (){
                                            ViewCommission(snapshot, index, globalVolume);
                                          },
                                          child: Text(
                                            'View Commission',style: TextStyle(
                                            color: Colors.green
                                          ),
                                          ),
                                        );
                                        return ListTile(
                                          title: Text(
                                              '${index + 1} . ${snapshot1.data.docs[index].get('name')}'),
                                        );
                                      },
                                    );
                                    // return DynamicTreeView(
                                    //   data: List<BaseData>.generate(
                                    //     snapshot1.data.docs.length,
                                    //     (index1) {
                                    //       var data1 =
                                    //           snapshot1.data.docs[index1];
                                    //       return DataModel(
                                    //         id: int.parse(
                                    //               data1.get('level').toString(),
                                    //             ) +
                                    //             1,
                                    //         name: data1.get('name'),
                                    //         parentId:
                                    //             int.parse(data1.get('level').toString()) ==
                                    //                     0
                                    //                 ? -1
                                    //                 : int.parse(
                                    //                     data1.get('level').toString(),
                                    //                   ),
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      //product & today deals
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          height: size.height * 0.85,
                          width: size.width * 0.35,
                          child: Card(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height * 0.35,
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 2.0,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Your Products',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                RaisedButton.icon(
                                                  color: kPrimaryColor,
                                                  icon: Icon(Icons.visibility,
                                                      color: Colors.white),
                                                  onPressed: () => view(
                                                      'product', 'My Products'),
                                                  label: Text(
                                                    'View',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .button
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: size.height * 0.35,
                                        width: double.infinity,
                                        child: Card(
                                          elevation: 2.0,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Today's Deals",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6,
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  RaisedButton.icon(
                                                    color: kPrimaryColor,
                                                    icon: Icon(Icons.visibility,
                                                        color: Colors.white),
                                                    onPressed: () => view(
                                                        'deals',
                                                        "Today's Deals"),
                                                    label: Text(
                                                      'View',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  view(dname, title) {
    showDialog(
      context: context,
      builder: (context) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Products')
              .doc(dname)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter stateSetter) {
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.get('productlist').length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data.get('productlist');
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(data[index]),
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: RaisedButton(
                              color: kPrimaryColor,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }

  //commission
  ViewCommission(AsyncSnapshot snapshot, int index, int globalVolume) {
    var pv =  snapshot.data.docs[index].get('personalVolume');
    var gv = globalVolume;
    var total = 0;
    return pv <= 3000 && gv >= 12000 && gv <= 50099?
       total = (gv/100 * 1.5) as int:
    pv <= 3000 && gv >= 51000 && gv <= 101999?
       total = (gv/100 * 3.0) as int:
    pv <= 3000 &&gv >= 102000 && gv <= 203999?
      total = (gv/100 * 4.5) as int:
    pv <= 3000 && gv >= 204000 && gv <= 407999?
      total = (gv/100 * 6.0) as int:
    pv <= 3000 && gv >= 408000 && gv <= 713999?
      total = (gv/100 * 7.5) as int:
    pv <= 3000 && gv >= 714000 && gv <= 1019999?
      total = (gv/100 * 9.0) as int:
    pv <= 3000 && gv >= 1020000 ?
      total = (gv/100 * 10.5) as int:
    pv >= 3000 && gv <= 12000?
        print("increse your volume "):

    FirebaseFirestore.instance.collection('Users')
        .doc(snapshot.data.id).update({"groupVolume": total});

  }
}


