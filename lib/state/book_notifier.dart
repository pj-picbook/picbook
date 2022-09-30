import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/book.dart';
import 'package:picbook/domain/entity/bookshelf_history.dart';
import '../../infrastructure/bookshelf_history_repository.dart';
import '../../infrastructure/bookshelf_repository.dart';
import '../../infrastructure/books_repository.dart';
import '../../infrastructure/auth_repository.dart';

final bookNotifierProvider = StateNotifierProvider<BookNotifier, Book>((ref) {
  return BookNotifier(
    bookshelfRepository: ref.read(bookshelfRepositoryProvider),
    booksRepository: ref.read(booksRepositoryProvider),
    bookshelfHistoryRepository: ref.read(bookshelfHistoryRepositoryProvider),
    baseAuthRepository: ref.read(authRepositoryProvider),
  );
});

class BookNotifier extends StateNotifier<Book> {
  BookNotifier({
    required BookshelfRepository bookshelfRepository,
    required BooksRepository booksRepository,
    required BookshelfHistoryRepository bookshelfHistoryRepository,
    required BaseAuthRepository baseAuthRepository,
  })  : _bookshelfRepository = bookshelfRepository,
        _booksRepository = booksRepository,
        _bookshelfHistoryRepository = bookshelfHistoryRepository,
        _baseAuthRepository = baseAuthRepository,
        super(Book.initial());

  final BookshelfRepository _bookshelfRepository;
  final BooksRepository _booksRepository;
  final BookshelfHistoryRepository _bookshelfHistoryRepository;
  final BaseAuthRepository _baseAuthRepository;

  /// 検索画面、絵本の棚画面で更新。本棚詳細画面で参照
  void set(Book newBook) {
    state = newBook;
  }

  Future<void> registerBook({
    required Book book,
  }) async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    book = book.copyWith(
      registeredDateTime: DateTime.now(),
    );
    await _booksRepository.create(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO:本来は複数予定
      book: book,
    );
  }

  Future<void> deleteBook({
    required Book book,
    required void Function() finishCallback,
  }) async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    await _booksRepository.delete(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO:本来は複数予定
      book: book,
    );
    finishCallback();
  }

  Future<void> readBook({
    required Book book,
  }) async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    final bookshelfHistory = BookshelfHistory(date: DateTime.now(), book: book);
    await _bookshelfHistoryRepository.create(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO:本来は複数予定
      bookshelfHistory: bookshelfHistory,
    );
  }
}
