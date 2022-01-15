import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

const app_users_collection = "usersGetx";

class FirestoreService<T> {
  String _logName = "Firestore service";

  final String collection;

  FirestoreService(this.collection);

  _logError(e) => log("Firestore error", name: _logName, error: e);

  /// GENERATE ID
  String generateId() {
    return FirebaseFirestore.instance.collection(collection).doc().id;
  }

  /// ADD
  Future<DocumentReference> add(Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .add(data)
        .catchError((e) {
      _logError(e);
    });
  }

  /// SET
  Future<void> set(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data)
        .catchError((e) => _logError(e));
  }

  /// UPDATE
  Future<void> update(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .update(data)
        .catchError((e) => _logError(e));
  }

  /// MERGE
  Future<void> merge(String id, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .set(data, SetOptions(merge: true))
        .catchError((e) => _logError(e));
  }

  /// GET
  Future<DocumentSnapshot> get(String id) async {
    return await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .get()
        .catchError((e) {
      _logError(e);
    });
  }

  /// DELETE
  Future<void> delete(String id) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .delete()
        .catchError((e) => _logError(e));
  }

  /// LISTEN DOCUMENT
  StreamSubscription<DocumentSnapshot> listen(
      String id,
      Function(DocumentSnapshot doc) onSnapshot,
      Function(dynamic error) onError) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .snapshots()
        .listen(onSnapshot, onError: (e) {
      _logError(e);
      onError.call(e);
    });
  }

  /// LISTEN QUERY
  StreamSubscription listenQuery(
      Query query, T Function(Map<String, dynamic>) modelBuilder,
      {required Function(List<T>) onAdded,
      required Function(List<T>) onModified,
      required Function(List<T>) onRemoved,
      required Function(Object) onError}) {
    _onResponse(QuerySnapshot qs) {
      List<T> added = [];
      List<T> modified = [];
      List<T> removed = [];
      if (qs.docChanges.length != 0) {
        qs.docChanges.forEach((dc) {
          switch (dc.type) {
            case DocumentChangeType.added:
              added.add(modelBuilder(dc.doc.data() as Map<String, dynamic>));
              break;
            case DocumentChangeType.modified:
              modified.add(modelBuilder(dc.doc.data() as Map<String, dynamic>));
              break;

            case DocumentChangeType.removed:
              // TODO: Handle this case.
              break;
          }
        });

        if (added.length > 0) onAdded(added);
        if (modified.length > 0) onModified(modified);
        if (removed.length > 0) onRemoved(removed);
      }
    }

    return query.snapshots().listen(_onResponse, onError: (e) {
      _logError(e);
      onError.call(e);
    });
  }
}
