import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entity/book.dart';
import '../../infrastructure/rakuten_book_repository.dart';
import '../../infrastructure/bookshelf_repository.dart';
import '../../infrastructure/books_repository.dart';
import '../../infrastructure/auth_repository.dart';
import '../../state/search_book_state.dart';

final rakutenBookPageNotifierProvider =
    StateNotifierProvider<SearchBookPageNotifier, SearchBookState>((ref) {
  return SearchBookPageNotifier(
    rakutenBookRepository: ref.read(rakutenBookRepositoryProvider),
    bookshelfRepository: ref.read(bookshelfRepositoryProvider),
    booksRepository: ref.read(booksRepositoryProvider),
    baseAuthRepository: ref.read(authRepositoryProvider),
  );
});

///
class SearchBookPageNotifier extends StateNotifier<SearchBookState> {
  SearchBookPageNotifier({
    required RakutenBookRepository rakutenBookRepository,
    required BookshelfRepository bookshelfRepository,
    required BooksRepository booksRepository,
    required BaseAuthRepository baseAuthRepository,
  })  : _rakutenBookRepository = rakutenBookRepository,
        _bookshelfRepository = bookshelfRepository,
        _booksRepository = booksRepository,
        _baseAuthRepository = baseAuthRepository,
        super(SearchBookState(books: []));

  final RakutenBookRepository _rakutenBookRepository;
  final BookshelfRepository _bookshelfRepository;
  final BooksRepository _booksRepository;
  final BaseAuthRepository _baseAuthRepository;

  Future<void> fetch({
    required SearchType searchType,
    required String keyWord,
  }) async {
    state = await _rakutenBookRepository.search(
      searchType: searchType,
      keyWord: keyWord,
    );
  }

  Future<void> registerBook({
    required Book book,
  }) async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    await _booksRepository.create(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO:本来は複数予定
      book: book,
    );
  }
}
