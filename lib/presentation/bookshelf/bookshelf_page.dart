import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import 'package:picbook/presentation/bookshelf/bookshelf_notifier.dart';
import 'package:picbook/state/book_notifier.dart';
import 'package:picbook/presentation/searchbook/searchbook_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 本棚画面クラス
class BookshelfPage extends HookConsumerWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookshelfNotifierProvider);
    final notifier = ref.watch(bookshelfNotifierProvider.notifier);
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);

    useEffect(() {
      Future<void> fetchAll() async {
        await notifier.fetchAll();
      }

      fetchAll();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('絵本の棚'),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: List.generate(
            state.books.length,
            (index) => InkWell(
              onTap: () {
                // 作品詳細画面に表示するデータをセットする
                bookNotifier.set(state.books[index]!);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const BookDetailPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  state.books[index]!.largeImageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('AB4934'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const SearchBookPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
