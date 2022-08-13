import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/bookshelf.dart';

final bookshelfRepository = Provider((ref) => BookshelfRepository()..init());

class BookshelfRepository {
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;

  void init() {
    _usersRef = _db.collection('users');
  }

  Future<Bookshelf> findById({required String uid, required String id}) async {
    final bookshelfRef = _usersRef.doc(uid).collection('bookshelfs');
    final doc = await bookshelfRef.doc(id).get();
    return Bookshelf.fromJson(_jsonFromSnapshot(doc));
  }

  Future<List<Bookshelf>> fetchAll({required String uid}) async {
    final bookshelfRef = _usersRef.doc(uid).collection('bookshelfs');
    final snapshot = await bookshelfRef.get();
    return snapshot.docs
        .map(
          (item) => Bookshelf.fromJson(
            _jsonFromSnapshot(item),
          ),
        )
        .toList();
  }

  Future<void> create(
      {required String uid, required Bookshelf bookshelf}) async {
    final bookshelfRef = _usersRef.doc(uid).collection('bookshelfs');
    await bookshelfRef.doc().set(bookshelf.toJson());
    // これだとidが初回入らない。次回updateしたときに更新される。
    // 現状問題にならないので放っておく。
  }

  // Future<void> update({required User user}) async {
  //   await _usersRef.doc(user.id).update(user.toJson());
  // }

  // Future<void> delete({required User user}) async {
  //   final docRef = _usersRef.doc(user.id);
  //   await docRef.delete();
  // }

  Map<String, dynamic> _jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    return {
      'id': json.id,
      'owner': json['owner'],
      'ownerBirthday': json['ownerBirthday'],
      'books': json['books'],
      'readHistories': json['readHistories'],
      'created': json['created'],
    };
  }
}
