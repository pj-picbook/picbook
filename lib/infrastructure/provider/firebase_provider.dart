import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseFirestore =
    Provider<FirebaseFirestore>(((ref) => FirestoreProvider.instance));

class FirestoreProvider {
  static get instance => FirebaseFirestore.instance;
}

final firebaseAuth =
    Provider<FirebaseAuth>(((ref) => FirebaseAuthProvider.instance));

class FirebaseAuthProvider {
  static get instance => FirebaseAuth.instance;
}
