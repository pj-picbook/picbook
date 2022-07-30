import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/user_repository.dart';

final myPageNotifierProvider =
    StateNotifierProvider<MyPageNotifier, User>((ref) {
  return MyPageNotifier(
    userRepository: ref.read(userRepository),
  );
});

class MyPageNotifier extends StateNotifier<User> {
  final UserRepository _userRepository;
  MyPageNotifier({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(User.initial());

  Future<void> fetch({required String id}) async {
    final user = await _userRepository.findById(id: id);
    state = state.copyWith(
      id: user.id,
      name: user.name,
      email: user.email,
      linkedAccount: user.linkedAccount,
      bookshelfs: user.bookshelfs,
    );
  }
}
