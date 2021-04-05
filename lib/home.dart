import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sgmart/auth.dart';
import 'package:sgmart/constants.dart';
import 'package:sgmart/widgets/treeview.dart';

class UserHomePage extends StatefulWidget {
  User user;
  UserHomePage({this.user});
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  var groupvaolume = 0; //inital groupVolume
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int commssion = 0; // intial commission value
  bool clicked = false; // for disable commission btn

  //for calculate commission
  Future getData(snapshot) async {
    //querysnapshot return type of data
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection('Users')
        .where('id', isGreaterThanOrEqualTo: '${snapshot.data.get('id')}')
        .where('id', isLessThanOrEqualTo: '${snapshot.data.get('id')}~')
        .orderBy('id')
        .get();
    return data.docs;
  }

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
                  .doc(widget.user.photoURL)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  print(widget.user.photoURL);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(widget.user.photoURL);
                  var data = snapshot.data;
                  return Container(
                    height: size.height * 0.85,
                    child: Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //first letter of name
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
                                  Text(
                                      '${data.get('name')}\n${data.get('address')}'),
                                  Text(
                                      '₹ ${data.get('groupVolume')} \nGroup Volume'),
                                  Text(
                                      '${data.get('phone')} \n your referal id'),
                                  kIsWeb
                                      //clipboard
                                      ? IconButton(
                                          icon: Icon(
                                            Icons.copy,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            Clipboard.setData(
                                              new ClipboardData(
                                                  text: data.get('phone')),
                                            ).then((result) {
                                              final snackBar = SnackBar(
                                                content:
                                                    Text('Copied to Clipboard'),
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
                                        ) //phone view
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //referal text
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Your Referals',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                //commission amount
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    commssion.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                //commission button
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () async {
                                    var data1 = await getData(snapshot);
                                    var volume = 0;
                                    await data1.forEach(
                                        (QueryDocumentSnapshot element) {
                                      print(element.get('name'));
                                      volume += element.get('personalVolume');
                                    });
                                    setState(() {
                                      commssion = ViewCommission(snapshot,
                                          data.get('personalVolume'), volume);
                                      groupvaolume = volume;
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(snapshot.data.id)
                                          .update({
                                        "commission": commssion,
                                        "groupVolume": volume
                                      });
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'View Commission',
                                          style: TextStyle(
                                              // backgroundColor: Colors.green,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
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
                                  .orderBy('id')
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
                                      itemBuilder: (context, index1) {
                                        DocumentSnapshot data1 =
                                            snapshot1.data.docs[index1];
                                        return TreeChild(
                                          docs: snapshot1.data.docs,
                                          i: index1,
                                          padding: double.parse(data1
                                                  .get('level')
                                                  .toString()) *
                                              20,
                                        );
                                      });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  //product & today deal
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
  int ViewCommission(AsyncSnapshot snapshot, pv, int gv) {
    return pv >= 3000 && gv >= 12000 && gv <= 50099
        ? int.parse((gv / 100 * 1.5).toString())
        : pv >= 3000 && gv >= 51000 && gv <= 101999
            ? int.parse((gv / 100 * 3.0).toString())
            : pv >= 3000 && gv >= 102000 && gv <= 203999
                ? int.parse((gv / 100 * 4.5).toString())
                : pv >= 3000 && gv >= 204000 && gv <= 407999
                    ? int.parse((gv / 100 * 6.0).toString())
                    : pv >= 3000 && gv >= 408000 && gv <= 713999
                        ? int.parse((gv / 100 * 7.5).toString())
                        : pv >= 3000 && gv >= 714000 && gv <= 1019999
                            ? int.parse((gv / 100 * 9.0).toString())
                            : pv >= 3000 && gv >= 1020000
                                ? int.parse((gv / 100 * 10.5).toString())
                                : _buildErrorDialog(context,
                                    'Eigther your personal volume is low or your group volume ');
  }

  //alert dialog
  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
