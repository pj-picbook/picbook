import 'dart:convert' as convert;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/searched_book.dart';
import '../domain/entity/book.dart';
import '../common/client/http_client.dart';

final rakutenBookRepository = Provider((ref) => RakutenBookRepository());

/// RakutenBooksから取得できる本の情報を操作するリポジトリ
class RakutenBookRepository {
  Future<SearchedBook> findByKeyWord({required String keyWord}) async {
    final httpClient = HttpClient(uri: _createUri(searchText: keyWord));
    final client = await httpClient.connect(type: RequestType.get);
    final searchedBook = SearchedBook(books: []);

    if (client.isParameterError || client.response == null) {
      return searchedBook;
    }

    if (client.response!.statusCode != 200) {
      return searchedBook;
    }

    final bookItems =
        convert.jsonDecode(client.response!.body) as Map<String, dynamic>;

    // TODO:バリデーション
    final List<Book> books = [];

    bookItems['Items'].forEach(
      (element) {
        books.add(
          Book(
            title: element['Item']['title'],
            author: element['Item']['author'],
            booksGenreId: element['Item']['booksGenreId'],
            isbn: element['Item']['isbn'],
            itemUrl: element['Item']['itemUrl'],
            largeImageUrl: element['Item']['largeImageUrl'],
            mediumImageUrl: element['Item']['mediumImageUrl'],
            smallImageUrl: element['Item']['smallImageUrl'],
          ),
        );
      },
    );
    searchedBook.books = books;
    return searchedBook;
  }

  Uri _createUri({required String searchText}) {
    return Uri.https(
      'app.rakuten.co.jp',
      'services/api/BooksTotal/Search/20170404',
      {
        'applicationId': '1018504903391410388',
        'keyword': searchText,
        'booksGenreId': '001003',
        'genrePath': '0',
      },
    );
  }
}
