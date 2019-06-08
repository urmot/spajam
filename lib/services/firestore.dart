import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spajam/model/member.dart';

final CollectionReference memberCollection =
    Firestore.instance.collection('members');

class FirebaseFirestoreService {
  static final FirebaseFirestoreService _instance =
      new FirebaseFirestoreService.internal();

  factory FirebaseFirestoreService() => _instance;

  FirebaseFirestoreService.internal();

  Future<Member> createMember(
      String id,
      String name,
      String tel,
      String image,
      String participationRate,
      bool isParticipation,
      bool isActiveHealth,
      bool isActiveMap) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(memberCollection.document());

      final Member member = new Member(ds.documentID, name, tel, image,
          participationRate, isParticipation, isActiveHealth, isActiveMap);
      final Map<String, dynamic> data = member.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Member.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getMemberList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = memberCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<dynamic> updateMember(Member member) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
          await tx.get(memberCollection.document(member.id));

      await tx.update(ds.reference, member.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteMember(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(memberCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }
}
