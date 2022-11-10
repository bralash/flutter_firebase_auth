// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginui/read_data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;

  List<String> docIds = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            // print(document.reference);
            docIds.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: FirebaseAuth.instance.signOut,
                  child: Icon(Icons.logout, size: 15),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber[800],
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: ((context, snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: GetUserName(
                        documentId: docIds[index],
                      ));
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
