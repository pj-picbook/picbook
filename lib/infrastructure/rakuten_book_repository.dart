import 'dart:convert' as convert;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/search_book_state.dart';
import '../domain/entity/book.dart';
import '../infrastructure/provider/http_client.dart';
import '/domain/entity/rakuten/items.dart';

final rakutenBookRepository = Provider((ref) => RakutenBookRepository());

/// RakutenBooksから取得できる本の情報を操作するリポジトリ
class RakutenBookRepository {
  Future<SearchBookState> search({required String keyWord}) async {
    final httpClient = HttpClient(uri: _createUri(searchText: keyWord));
    final client = await httpClient.connect(type: RequestType.get);

    if (client.isParameterError || client.response == null) {
      return SearchBookState(books: []);
    }

    if (client.response!.statusCode != 200) {
      return SearchBookState(books: []);
    }

    final bookItems = Items.fromJson(convert.jsonDecode(client.response!.body));
    // TODO:バリデーション
    final List<Book> books = [];

    for (final item in bookItems.items) {
      books.add(
        Book(
          title: item.book.title,
          author: item.book.author,
          booksGenreId: item.book.booksGenreId,
          isbn: item.book.isbn,
          itemUrl: item.book.itemUrl,
          largeImageUrl: item.book.largeImageUrl,
          mediumImageUrl: item.book.mediumImageUrl,
          smallImageUrl: item.book.smallImageUrl,
        ),
      );
    }
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
