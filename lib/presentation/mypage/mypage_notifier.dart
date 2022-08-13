import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/domain/entity/user.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';

final myPageNotifierProvider =
    StateNotifierProvider<MyPageNotifier, User>((ref) {
  return MyPageNotifier(
    userRepository: ref.read(userRepository),
    authRepository: ref.read(authRepositoryProvider),
  );
});

///
class MyPageNotifier extends StateNotifier<User> {
  final UserRepository _userRepository;
  final BaseAuthRepository _authRepository;
  final logger = Logger();
  MyPageNotifier(
      {required UserRepository userRepository,
      required BaseAuthRepository authRepository})
      : _userRepository = userRepository,
        _authRepository = authRepository,
        super(User.initial());

  /// 受け取ったidをもとにUserRepositoryのfindByIdを呼び出し
  /// stateを最新のユーザー情報へ更新する
  Future<void> fetch({required String id}) async {
    final user = await _userRepository.findById(id: id);
    state = state.copyWith(
      id: user.id,
      email: user.email,
      linkedAccount: user.linkedAccount,
    );
  }

  Future<void> logOut() async {
    try {
      await _authRepository.logOut();
    } catch (e) {
      logger.e(e);
    }
  }
}
