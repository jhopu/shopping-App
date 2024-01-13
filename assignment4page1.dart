import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/assignment4page2.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_page.dart';
class Assigmfirstpage extends StatefulWidget {
  @override
  _ClickableIconButtonState createState() => _ClickableIconButtonState();
}

class _ClickableIconButtonState extends State<Assigmfirstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Shopping List',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {

            GoogleSignIn().signOut();
            FirebaseAuth.instance.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (contex)=>LoginPage()));
            });
          },
          icon: Icon(Icons.logout),
        ),
      ),
      body: StreamBuilder(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildUser(User user) => ListTile(
        title: Text(user.name,
        style: TextStyle(fontSize: 25),),
        trailing: GestureDetector(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context)=>AssignsecondPages(
                data: user.name,
                data1: user.Price,
                data2: user.id,

              )));
            },
            child: Text(
              "PREORDER",

              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),
            )),
      );
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

class User {
  final String name;
  final int Price;
  String id;
  User({
    required this.id,
    required this.Price,
    required this.name,
  });
  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        Price: json['Price'],
    id: json['id'],
      );
}
