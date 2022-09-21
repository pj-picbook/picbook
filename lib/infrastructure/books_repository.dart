import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/entity/book.dart';

final booksRepositoryProvider = Provider((ref) => BooksRepository()..init());

class BooksRepository {
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;

  void init() {
    _usersRef = _db.collection('users');
  }

  Future<List<Book>> fetchAll({
    required String uid,
    required String bookshelfId,
  }) async {
    final booksRef = _usersRef
        .doc(uid)
        .collection('bookshelfs')
        .doc(bookshelfId)
        .collection('books');
    final snapshot = await booksRef.get();
    return snapshot.docs
        .map(
          (item) => Book.fromJson(
            _jsonFromSnapshot(item),
          ),
        )
        .toList();
  }

  Future<void> create({
    required String uid,
    required String bookshelfId,
    required Book book,
  }) async {
    await _usersRef
        .doc(uid)
        .collection('bookshelfs')
        .doc(bookshelfId)
        .collection('books')
        .doc(book.isbn)
        .set(book.toJson());
  }

  Future<void> delete({
    required String uid,
    required String bookshelfId,
    required Book book,
  }) async {
    await _usersRef
        .doc(uid)
        .collection('bookshelfs')
        .doc(bookshelfId)
        .collection('books')
        .doc(book.isbn)
        .delete();
  }

  Map<String, dynamic> _jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    return {
      'title': json['title'],
      'isbn': json['isbn'],
      'titleKana': json['titleKana'],
      'subTitle': json['subTitle'],
      'subTitleKana': json['subTitleKana'],
      'seriesName': json['seriesName'],
      'seriesNameKana': json['seriesNameKana'],
      'contents': json['contents'],
      'contentsKana': json['contentsKana'],
      'author': json['author'],
      'authorKana': json['authorKana'],
      'publisherName': json['publisherName'],
      'size': json['size'],
      'itemCaption': json['itemCaption'],
      'salesDate': json['salesDate'],
      'itemPrice': json['itemPrice'],
      'itemUrl': json['itemUrl'],
      'affiliateUrl': json['affiliateUrl'],
      'smallImageUrl': json['smallImageUrl'],
      'mediumImageUrl': json['mediumImageUrl'],
      'largeImageUrl': json['largeImageUrl'],
    };
  }
}
