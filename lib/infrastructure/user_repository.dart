import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';

final userRepository = Provider((ref) => UserRepository());

class UserRepository {
  final _db = FirebaseFirestore.instance;

  Future<User> findById({required String id}) async {
    final collectionRef = _db.collection('users');
    final doc = await collectionRef.doc(id).get();
    return User.fromJson(_jsonFromSnapshot(doc));
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
