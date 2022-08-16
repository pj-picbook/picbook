import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/domain/entity/book.dart';

final bookNotifierProvider = StateNotifierProvider<BookNotifier, Book>((ref) {
  return BookNotifier();
});

/// 検索画面、絵本の棚画面で更新。本棚詳細画面で参照
class BookNotifier extends StateNotifier<Book> {
  BookNotifier() : super(Book.initial());

  void set(Book newBook) {
    state = newBook;
  }
}
