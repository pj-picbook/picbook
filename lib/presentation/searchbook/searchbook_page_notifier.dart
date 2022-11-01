import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/rakuten_book_repository.dart';
import '../../state/search_book_state.dart';
import '../../domain/entity/rakuten/items.dart';

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
        super(SearchBookState(items: Items.dummy(), books: []));

  final RakutenBookRepository _rakutenBookRepository;

  int _nowGetPage = 1;
  bool _isLoading = false;
  SearchType _nowSearchType = SearchType.keyword;
  String _nowSearchKeyWord = '';

  Future<void> fetch({
    required SearchType searchType,
    required String keyWord,
  }) async {
    state = await _rakutenBookRepository.search(
      searchType: searchType,
      keyWord: keyWord,
    );
    _nowSearchType = searchType;
    _nowSearchKeyWord = keyWord;
    _nowGetPage = 1;
    _isLoading = false;
  }

  Future<void> loadIfNeeded(int readIndex) async {
    if (_nowGetPage == state.items.pageCount) return;
    if (readIndex < state.items.last || _isLoading) return;

    _isLoading = true;
    ++_nowGetPage;
    state = await _rakutenBookRepository.search(
      searchType: _nowSearchType,
      keyWord: _nowSearchKeyWord,
      getPage: _nowGetPage,
      addBooks: state.books,
    );
    _isLoading = false;
  }
}
