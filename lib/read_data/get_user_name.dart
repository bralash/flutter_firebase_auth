// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  const GetUserName({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black87,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['firstName'][0]}',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 80, color: Colors.white),
                        ),
                        Text(
                          '${data['lastName'][0]}',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 80, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('Share a little bit about yourself'),
                      SizedBox(height: 30),
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              )),
                              child: Icon(
                                Icons.person_outline,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'Fullame',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    'Emmanuel Asaber',
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black87,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              )),
                              child: Icon(
                                Icons.email_outlined,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${data['email']}',
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                              )),
                              child: Icon(
                                Icons.calendar_month_outlined,
                                size: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  Text(
                                    '${data['age']}',
                                    style: GoogleFonts.quicksand(
                                      color: Colors.black87,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }
          return Text('Loading...');
        });
  }
}
