import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../searchbook/searchbook_page.dart';
import '../searchbook/searchbook_page_notifier.dart';
import '../../infrastructure/rakuten_book_repository.dart';

class BarcodeScannerPage extends HookConsumerWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(rakutenBookPageNotifierProvider.notifier);
    bool isLoading = false;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: MobileScanner(onDetect: (barcode, args) async {
              if (isLoading) return;
              // memo:何度も呼ばれるのでリターン
              isLoading = true;
              final String code = barcode.rawValue ?? '';
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchBookPage()),
              );
              await notifier.fetch(searchType: SearchType.isbn, keyWord: code);
            }),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: const Text(
                '絵本についてるバーコードを読み取って検索しよう',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
