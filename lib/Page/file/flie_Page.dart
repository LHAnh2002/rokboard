import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class FliePage extends StatelessWidget {
  final email;
  const FliePage({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 116, 116),
        title: const Text(
          'File To Excel',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("user")
            .doc(email)
            .collection('file')
            .orderBy("Date")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Lỗi Connet'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      final uri = Uri.parse(
                          snapshot.data!.docChanges[index].doc['Link']);
                      print(uri);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      } else {
                        throw 'Could not launch $uri';
                      }
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 10, top: 10)
                              .r,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color.fromARGB(255, 233, 88, 88),
                        ),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(7.0).r),
                      ),
                      child: Text(
                        snapshot.data!.docChanges[index].doc['Date']
                            .toDate()
                            .toString(),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
