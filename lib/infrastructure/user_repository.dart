import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';

final userRepository = Provider((ref) => UserRepository()..init());

/// usersコレクションを操作するrepository
class UserRepository {
  final _db = FirebaseFirestore.instance;
  late final CollectionReference _usersRef;

  void init() {
    _usersRef = _db.collection('users');
  }

  /// idをもとにusersコレクションからユーザー情報を取得する
  Future<User> findById({required String id}) async {
    final doc = await _usersRef.doc(id).get();
    return User.fromJson(_jsonFromSnapshot(doc));
  }

  Future<void> create({required User user}) async {
    await _usersRef.doc(user.id).set(user.toJson());
  }

  Future<void> update({required User user}) async {
    await _usersRef.doc(user.id).update(user.toJson());
  }

  Future<void> delete({required User user}) async {
    final docRef = _usersRef.doc(user.id);
    await docRef.delete();
  }

  Map<String, dynamic> _jsonFromSnapshot<T extends DocumentSnapshot>(T json) {
    return {
      'id': json.id,
      'name': json['name'],
      'email': json['email'],
      'linkedAccount': json['linkedAccount'],
      'bookshelfs': json['bookshelfs'],
    };
  }
}
