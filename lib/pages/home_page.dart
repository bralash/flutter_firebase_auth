// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginui/read_data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  User? currentUser = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: currentUser?.email).get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIds.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed In as: ' + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.amber[800],
              child: Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: ((context, snapshot) {
                return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetUserName(documentId: docIds[index],)
                    );
                  },
                );
              }),
            )),
          ],
        ),
      ),
    );
  }
}
