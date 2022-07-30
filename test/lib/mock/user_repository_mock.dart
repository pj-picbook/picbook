import 'dart:math';

import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/user_repository.dart';

class UserRepositoryMock implements UserRepository {
  final Map<String, User> _data = {};
  late String nextId;

  // mock only
  void reset() {
    nextId = '';
    _data.clear();
  }

  // mock only
  // firestoreで自動付与されるIDの模倣
  void issueId() {
    final rand = Random(DateTime.now().microsecondsSinceEpoch);
    nextId = rand.nextInt(4294967296).toString();
  }

  // mock only
  void set(User user) {
    issueId();
    _data[nextId] = user;
  }

  // mock only
  Map<String, User> get() {
    return _data;
  }

  @override
  void create({required User user}) {
    //
  }

  @override
  void delete({required User user}) {
    //
  }

  @override
  Future<User> findById({required String id}) {
    return Future.value(_data[id]);
  }

  @override
  void update({required User user}) {
    //
  }
}
