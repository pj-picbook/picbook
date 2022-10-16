import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/book.dart';

part 'registered_books_state.freezed.dart';

@freezed
class RegisteredBooksState with _$RegisteredBooksState {
  const RegisteredBooksState._();

  factory RegisteredBooksState({
    required List<Book?> books,
    required List<String?> registered, //MEMO:登録済みのisbnは別で持つ
  }) = _RegisteredBooksState;
}
