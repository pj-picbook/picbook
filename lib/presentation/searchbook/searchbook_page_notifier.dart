import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/rakuten_book_repository.dart';
import '../../state/search_book_state.dart';

final rakutenBookPageNotifierProvider =
    StateNotifierProvider<SearchBookPageNotifier, SearchBookState>((ref) {
  return SearchBookPageNotifier(
    rakutenBookRepository: ref.read(rakutenBookRepositoryProvider),
  );
});

///
class SearchBookPageNotifier extends StateNotifier<SearchBookState> {
  SearchBookPageNotifier({
    required RakutenBookRepository rakutenBookRepository,
  })  : _rakutenBookRepository = rakutenBookRepository,
        super(SearchBookState(books: []));

  final RakutenBookRepository _rakutenBookRepository;

  Future<void> fetch({
    required SearchType searchType,
    required String keyWord,
  }) async {
    state = await _rakutenBookRepository.search(
      searchType: searchType,
      keyWord: keyWord,
    );
  }
}
