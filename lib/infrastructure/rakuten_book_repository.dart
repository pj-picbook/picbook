import 'dart:convert' as convert;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/search_book_state.dart';
import '../domain/entity/book.dart';
import '../common/client/http_client.dart';

final rakutenBookRepository = Provider((ref) => RakutenBookRepository());

/// RakutenBooksから取得できる本の情報を操作するリポジトリ
class RakutenBookRepository {
  Future<SearchBookState> findByKeyWord({required String keyWord}) async {
    final httpClient = HttpClient(uri: _createUri(searchText: keyWord));
    final client = await httpClient.connect(type: RequestType.get);

    if (client.isParameterError || client.response == null) {
      return SearchBookState(books: []);
    }

    if (client.response!.statusCode != 200) {
      return SearchBookState(books: []);
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
    return SearchBookState(books: books);
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
