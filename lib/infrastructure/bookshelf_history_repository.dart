import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/bookshelf_history.dart';

final bookshelfHistoryRepositoryProvider =
    Provider((ref) => BookshelfHistoryRepository()..init());

class BookshelfHistoryRepository {
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;

  void init() {
    _usersRef = _db.collection('users');
  }

  Future<List<BookshelfHistory>> fetchAllOrderByDate({
    required String uid,
    required String bookshelfId,
  }) async {
    final booksRef = _usersRef
        .doc(uid)
        .collection('bookshelfs')
        .doc(bookshelfId)
        .collection('bookshelfHistories')
        .orderBy('date');
    final snapshot = await booksRef.get();
    return snapshot.docs
        .map(
          (item) => BookshelfHistory.fromJson(
            _jsonFromSnapshot(item),
          ),
        )
        .toList();
  }

  Future<void> create({
    required String uid,
    required String bookshelfId,
    required BookshelfHistory bookshelfHistory,
  }) async {
    await _usersRef
        .doc(uid)
        .collection('bookshelfs')
        .doc(bookshelfId)
        .collection('bookshelfHistories')
        .doc()
        .set(bookshelfHistory.toJson());
  }

  Map<String, dynamic> _jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    return {
      'date': json['date'],
      'book': json['book'],
    };
  }
}
