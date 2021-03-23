import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User_Detail extends StatefulWidget {
  @override
  _User_DetailState createState() => _User_DetailState();
}

class _User_DetailState extends State<User_Detail> {
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading....."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green)),
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          snapshot.data.docs[index].get("name"),
                        ),
                        subtitle: Text(
                          snapshot.data.docs[index].get('phone'),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
