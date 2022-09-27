import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/books_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/image_picker_service.dart';
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
    imagePickerService: ref.read(imagePickerServiceProvider),
  );
});

///
class MyPageNotifier extends StateNotifier<MyPageState> {
  final BaseAuthRepository _authRepository;
  final UserRepository _userRepository;
  final BookshelfRepository _bookshelfRepository;
  final BooksRepository _booksRepository;
  final ImagePickerService _imagePickerService;

  final logger = Logger();
  MyPageNotifier({
    required Logger logger,
    required BaseAuthRepository authRepository,
    required UserRepository userRepository,
    required BookshelfRepository bookshelfRepository,
    required BooksRepository booksRepository,
    required ImagePickerService imagePickerService,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        _bookshelfRepository = bookshelfRepository,
        _booksRepository = booksRepository,
        _imagePickerService = imagePickerService,
        super(MyPageState.initial());

  /// 受け取ったidをもとにUserRepositoryのfindByIdを呼び出し
  /// stateを最新のユーザー情報へ更新する
  Future<void> fetch() async {
    final uid = _authRepository.getUid();
    final user = await _userRepository.findById(id: uid!);
    final bookshelfs = await _bookshelfRepository.fetchAll(uid: uid);
    final bookshelf = bookshelfs.first;
    final books =
        await _booksRepository.fetchAll(uid: uid, bookshelfId: bookshelf.id);
    state = state.copyWith(
      user: user,
      currentBookshelf: bookshelf,
      books: books,
    );
  }

  Future<void> logOut() async {
    try {
      await _authRepository.logOut();
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final file =
          await _imagePickerService.pickImage(source: ImageSource.gallery);
    } catch (e) {
      logger.e(e);
    }
  }
}
