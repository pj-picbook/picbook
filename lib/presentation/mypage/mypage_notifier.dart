import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_state.dart';

final myPageNotifierProvider =
    StateNotifierProvider<MyPageNotifier, MyPageState>((ref) {
  return MyPageNotifier(
    userRepository: ref.read(userRepository),
    authRepository: ref.read(authRepositoryProvider),
    bookshelfRepository: ref.read(bookshelfRepository),
  );
});

///
class MyPageNotifier extends StateNotifier<MyPageState> {
  final BaseAuthRepository _authRepository;
  final UserRepository _userRepository;
  final BookshelfRepository _bookshelfRepository;

  final logger = Logger();
  MyPageNotifier({
    required BaseAuthRepository authRepository,
    required UserRepository userRepository,
    required BookshelfRepository bookshelfRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        _bookshelfRepository = bookshelfRepository,
        super(MyPageState.initial());

  /// 受け取ったidをもとにUserRepositoryのfindByIdを呼び出し
  /// stateを最新のユーザー情報へ更新する
  Future<void> fetch() async {
    final uid = _authRepository.getUid();
    final user = await _userRepository.findById(id: uid!);
    final bookshelfs = await _bookshelfRepository.fetchAll(uid: uid);
    final bookshelf = bookshelfs.first;
    state = state.copyWith(
      user: user,
      currentBookshelf: bookshelf,
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
