import 'dart:convert' as convert;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../state/search_book_state.dart';
import '../domain/entity/book.dart';
import '../domain/entity/rakuten/items.dart';
import '../infrastructure/provider/http_client.dart';

final rakutenBookRepositoryProvider = Provider(
  (ref) => RakutenBookRepository(),
);

enum SearchType {
  keyword,
  isbn,
}

/// RakutenBooksから取得できる本の情報を操作するリポジトリ
class RakutenBookRepository {
  Future<SearchBookState> search({
    required SearchType searchType,
    required String keyWord,
  }) async {
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
          isbn: item.book.isbn,
          titleKana: item.book.titleKana,
          subTitle: item.book.subTitle,
          subTitleKana: item.book.subTitleKana,
          seriesName: item.book.seriesName,
          seriesNameKana: item.book.seriesNameKana,
          contents: item.book.contents,
          contentsKana: item.book.contentsKana,
          author: item.book.author,
          authorKana: item.book.authorKana,
          publisherName: item.book.publisherName,
          size: item.book.size,
          itemCaption: item.book.itemCaption,
          salesDate: item.book.salesDate,
          itemPrice: item.book.itemPrice,
          itemUrl: item.book.itemUrl,
          affiliateUrl: item.book.affiliateUrl,
          smallImageUrl: item.book.smallImageUrl,
          mediumImageUrl: item.book.mediumImageUrl,
          largeImageUrl: item.book.largeImageUrl,
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
        'orFlag': '1',
      },
    );
  }
}
