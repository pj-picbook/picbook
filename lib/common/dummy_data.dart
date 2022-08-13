import 'package:picbook/domain/entity/book.dart';
import 'package:picbook/domain/entity/bookshelf.dart';
import 'package:picbook/domain/entity/bookshelf_history.dart';
import 'package:picbook/domain/entity/user.dart';

final User dummyUser = User(
  id: '0001',
  email: 'picbook@example.com',
  linkedAccount: 'Google',
);
final Book dummyBook = Book(title: 'book_title_1');

final List<Book> dummyBooks = [
  Book(title: 'book_title_1'),
  Book(title: 'book_title_2'),
  Book(title: 'book_title_3'),
];

final BookshelfHistory dummyBookshelfHistory = BookshelfHistory(
  date: DateTime.now(),
  book: dummyBook,
);

final List<BookshelfHistory> dummyBookshelfHistories = [
  BookshelfHistory(
    date: DateTime.now(),
    book: dummyBooks[0],
  ),
  BookshelfHistory(
    date: DateTime.now(),
    book: dummyBooks[1],
  ),
  BookshelfHistory(
    date: DateTime.now(),
    book: dummyBooks[2],
  ),
];

final Bookshelf dummyBookshelf = Bookshelf(
  id: 'bookshelf_id',
  owner: 'owner',
  ownerBirthday: DateTime.now(),
  books: dummyBooks,
  created: DateTime.now(),
);
