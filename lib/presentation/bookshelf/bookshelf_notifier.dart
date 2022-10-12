import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/retry.dart';
import 'package:picbook/domain/entity/book.dart';
import '../../state/registered_books_state.dart';
import '../../infrastructure/bookshelf_repository.dart';
import '../../infrastructure/books_repository.dart';
import '../../infrastructure/auth_repository.dart';

final bookshelfNotifierProvider =
    StateNotifierProvider<BookshelfNotifier, RegisteredBooksState>((ref) {
  return BookshelfNotifier(
    bookshelfRepository: ref.read(bookshelfRepositoryProvider),
    booksRepository: ref.read(booksRepositoryProvider),
    baseAuthRepository: ref.read(authRepositoryProvider),
  );
});

class BookshelfNotifier extends StateNotifier<RegisteredBooksState> {
  BookshelfNotifier({
    required BookshelfRepository bookshelfRepository,
    required BooksRepository booksRepository,
    required BaseAuthRepository baseAuthRepository,
  })  : _bookshelfRepository = bookshelfRepository,
        _booksRepository = booksRepository,
        _baseAuthRepository = baseAuthRepository,
        super(RegisteredBooksState(books: [], registered: []));

  final BookshelfRepository _bookshelfRepository;
  final BooksRepository _booksRepository;
  final BaseAuthRepository _baseAuthRepository;

  Future<void> fetchAll() async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    final books = await _booksRepository.fetchAll(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO: 本来は複数予定
    );

    List<String?> registered = [];

    if (books.isNotEmpty) {
      for (final sBook in books) {
        registered.add(sBook.isbn);
      }
    }
    state = RegisteredBooksState(books: books, registered: registered);
  }
}
