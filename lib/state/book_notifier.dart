import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/book.dart';

final bookProvider = Provider((ref) => Book());

final bookNotifierProvider = StateNotifierProvider<BookNotifier, Book>((ref) {
  return BookNotifier(
    bookProvider: ref.read(bookProvider),
  );
});

/// 検索画面、絵本の棚画面で更新。本棚詳細画面で参照
class BookNotifier extends StateNotifier<Book> {
  BookNotifier({required Book bookProvider}) : super(Book.initial());

  void set(Book newBook) {
    state = newBook;
  }
}
