import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/rakuten_book_repository.dart';
import '../../state/searched_book.dart';

final rakutenBookPageNotifierProvider =
    StateNotifierProvider<SearchBookPageNotifier, SearchedBook>((ref) {
  return SearchBookPageNotifier(
    rakutenBookRepository: ref.read(rakutenBookRepository),
  );
});

///
class SearchBookPageNotifier extends StateNotifier<SearchedBook> {
  SearchBookPageNotifier({required RakutenBookRepository rakutenBookRepository})
      : _rakutenBookRepository = rakutenBookRepository,
        super(SearchedBook(books: []));

  final RakutenBookRepository _rakutenBookRepository;

  Future<void> fetch({required String keyWord}) async {
    state = await _rakutenBookRepository.findByKeyWord(keyWord: keyWord);
  }
}
