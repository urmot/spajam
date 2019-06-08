import 'package:flutter/material.dart';
import 'package:spajam/ui/page/member_list/member_card.dart';
import 'package:spajam/model/member.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spajam/services/firestore.dart';

class MemerListPage extends StatefulWidget {
  @override
  _MemerListPageState createState() => new _MemerListPageState();
}

class _MemerListPageState extends State<MemerListPage> {
  List<Member> items;
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  StreamSubscription<QuerySnapshot> memberSub;

  @override
  void initState() {
    super.initState();

    items = new List();

    memberSub?.cancel();
    var listen = db.getMemberList(limit: 10).listen((QuerySnapshot snapshot) {
      final List<Member> members = snapshot.documents
          .map((documentSnapshot) => Member.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.items = members;
      });
    });
    memberSub = listen;
  }

  Size deviceSize;

  // final String image;

  // MemerListPage({this.image, Key key}) : super(key: key);
  // String memberImage,
  // String memberName,
  // String memberNumber,
  // bool isActive,
  // String participationRate,
  // bool isParticipation,
  // bool isActiveHealth,
  // bool isActiveMap,
  Widget body(BuildContext context) => SingleChildScrollView(
        child: Column(
            children: this.items.map<Widget>(
                  (item) => providerCard(
                        item.image,
                        item.name,
                        item.tel,
                        true,
                        item.participationRate,
                        item.isParticipation,
                        item.isActiveHealth,
                        item.isActiveMap,
                      ),
                )),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: <Widget>[
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: const Text(""),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: body(context),
      ),
    ]);
  }
}

// class MemerListPage extends StatelessWidget {}
