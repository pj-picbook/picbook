import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/book.dart';
import 'package:picbook/domain/entity/bookshelf_history.dart';
import 'package:picbook/presentation/stamp/stamp_state.dart';
import '../../infrastructure/bookshelf_repository.dart';
import '../../infrastructure/bookshelf_history_repository.dart';
import '../../infrastructure/auth_repository.dart';

final stampNotifierProvider =
    StateNotifierProvider<StampNotifier, StampState>((ref) {
  return StampNotifier(
    bookshelfRepository: ref.read(bookshelfRepositoryProvider),
    bookshelfHistoryRepository: ref.read(bookshelfHistoryRepositoryProvider),
    baseAuthRepository: ref.read(authRepositoryProvider),
  );
});

class StampNotifier extends StateNotifier<StampState> {
  final BookshelfRepository _bookshelfRepository;
  final BookshelfHistoryRepository _bookshelfHistoryRepository;
  final BaseAuthRepository _baseAuthRepository;

  StampNotifier({
    required BookshelfRepository bookshelfRepository,
    required BookshelfHistoryRepository bookshelfHistoryRepository,
    required BaseAuthRepository baseAuthRepository,
  })  : _bookshelfRepository = bookshelfRepository,
        _bookshelfHistoryRepository = bookshelfHistoryRepository,
        _baseAuthRepository = baseAuthRepository,
        super(StampState(
          focusedDay: DateTime.now(),
          selectedDay: null,
          events: null,
          books: null,
        ));

  Future<void> init() async {
    if (_baseAuthRepository.getUid() == null) return;
    final bookshelfs =
        await _bookshelfRepository.fetchAll(uid: _baseAuthRepository.getUid()!);
    final bookshelfHistories =
        await _bookshelfHistoryRepository.fetchAllOrderByDate(
      uid: _baseAuthRepository.getUid()!,
      bookshelfId: bookshelfs[0].id, // TODO:本来は複数予定
    );
    Map<DateTime, List<Book>>? events = {};
    for (BookshelfHistory bookshelfHistory in bookshelfHistories) {
      final readDateTime = DateTime.utc(
        bookshelfHistory.date!.year,
        bookshelfHistory.date!.month,
        bookshelfHistory.date!.day,
      );
      if (events[readDateTime] == null) {
        events[readDateTime] = [bookshelfHistory.book!];
      } else {
        events[readDateTime]!.add(bookshelfHistory.book!);
      }
    }
    state = state.copyWith(events: events);
  }

  void onDaySelected({
    required DateTime selectedDay,
    required DateTime focusedDay,
    required List<Book>? books,
  }) {
    state = state.copyWith(
      selectedDay: selectedDay,
      focusedDay: focusedDay,
      books: books,
    );
  }
}
