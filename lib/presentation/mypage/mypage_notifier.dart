import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/books_repository.dart';
import 'package:picbook/infrastructure/bookshelf_history_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/presentation/mypage/mypage_state.dart';

final myPageNotifierProvider =
    StateNotifierProvider<MyPageNotifier, MyPageState>((ref) {
  return MyPageNotifier(
    logger: ref.read(loggerProvider),
    userRepository: ref.read(userRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
    bookshelfRepository: ref.read(bookshelfRepositoryProvider),
    booksRepository: ref.read(booksRepositoryProvider),
    bookshelfHistoryRepository: ref.read(bookshelfHistoryRepositoryProvider),
  );
});

///
class MyPageNotifier extends StateNotifier<MyPageState> {
  final BaseAuthRepository _authRepository;
  final UserRepository _userRepository;
  final BookshelfRepository _bookshelfRepository;
  final BooksRepository _booksRepository;
  final BookshelfHistoryRepository _bookshelfHistoryRepository;

  final logger = Logger();
  MyPageNotifier({
    required Logger logger,
    required BaseAuthRepository authRepository,
    required UserRepository userRepository,
    required BookshelfRepository bookshelfRepository,
    required BooksRepository booksRepository,
    required BookshelfHistoryRepository bookshelfHistoryRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        _bookshelfRepository = bookshelfRepository,
        _booksRepository = booksRepository,
        _bookshelfHistoryRepository = bookshelfHistoryRepository,
        super(MyPageState.initial());

  /// 受け取ったidをもとにUserRepositoryのfindByIdを呼び出し
  /// stateを最新のユーザー情報へ更新する
  Future<void> fetch() async {
    final uid = _authRepository.getUid();
    final user = await _userRepository.findById(id: uid!);
    final bookshelfs = await _bookshelfRepository.fetchAll(uid: uid);
    final bookshelf = bookshelfs.first;
    final bookshelfHistory = await _bookshelfHistoryRepository
        .fetchAllOrderByDate(uid: uid, bookshelfId: bookshelf.id);
    final books =
        await _booksRepository.fetchAll(uid: uid, bookshelfId: bookshelf.id);
    state = state.copyWith(
      user: user,
      currentBookshelf: bookshelf,
      books: books,
      bookshelfHistory: bookshelfHistory,
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
