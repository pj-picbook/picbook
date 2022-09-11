import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/rakuten_book_repository.dart';
import 'package:picbook/presentation/book_detail/book_detail_page.dart';
import 'package:picbook/state/book_notifier.dart';
import '../../presentation/searchbook/searchbook_page_notifier.dart';
import '../widget/book_box.dart';
import '../widget/dialog.dart';
import '../barcode_scanner_page/barcode_scanner_page.dart';
import 'category_result.dart';

class CategoryPage extends HookConsumerWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rakutenBookPageNotifierProvider);
    final notifier = ref.watch(rakutenBookPageNotifierProvider.notifier);
    final textFieldController = useTextEditingController();
    final bookNotifier = ref.watch(bookNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.brown, //change your color here
        ),
        centerTitle: true,
        title: const Text(
          '検索画面',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.brown,
                        ),
                      ),
                      hintText: 'えほんのなまえをいれよう。',
                      hintStyle:
                          const TextStyle(fontSize: 17.0, color: Colors.brown),
                      prefixIcon: const Icon(Icons.search, color: Colors.brown),
                      suffixIcon: GestureDetector(
                        child: const Icon(Icons.qr_code, color: Colors.brown),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BarcodeScannerPage()),
                          );
                        },
                      ),
                    ),
                    onEditingComplete: () async {
                      await notifier.fetch(
                          searchType: SearchType.keyword,
                          keyWord: textFieldController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CategoryResultPage()));
                    },
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: Text(
                            'カテゴリからさがす',
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    notifier.fetch(
                        searchType: SearchType.keyword,
                        keyWord:
                            'しょうぼうじどうしゃじぷた　 モノレールのたび バスがきました そらののりものえほん でんしゃはうたう いたずらきかんしゃちゅうちゅう うみののりものえほん ');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CategoryResultPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Icon(
                              Icons.commute,
                              color: Colors.brown,
                              size: 35.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          const SizedBox(
                              width: 250,
                              child: Text(
                                'のりもの',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                          SizedBox(
                            width: 30,
                            child: Icon(Icons.chevron_right_rounded,
                                color: Colors.brown // アイコンの色を設定できる
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //カテゴリ「動物」はじまり
                SizedBox(
                  width: 30,
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    notifier.fetch(
                        searchType: SearchType.keyword,
                        keyWord:
                            '100万回生きたねこ まりーちゃんとひつじ ねずみくんとかくれんぼ ぐるんぱのようちえん あかちゃんぐまはなにみたの？ サーカスくまさん かあさんふくろう スーホの白い馬 ');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CategoryResultPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Icon(
                              Icons.pets,
                              color: Colors.brown,
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          const SizedBox(
                              width: 250,
                              child: Text(
                                'どうぶつ',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                          SizedBox(
                            width: 30,
                            child: Icon(Icons.chevron_right_rounded,
                                color: Colors.brown // アイコンの色を設定できる
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //カテゴリ「動物」終わり
                //カテゴリ「たべもの」はじまり
                SizedBox(
                  width: 30,
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    notifier.fetch(
                        searchType: SearchType.keyword,
                        keyWord:
                            'あいうえおにぎり　おとうふやさん だめだめすいか 魚市場 30000このすいか なにをたべたかわかる？ ');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CategoryResultPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Icon(
                              Icons.restaurant,
                              color: Colors.brown,
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          const SizedBox(
                              width: 250,
                              child: Text(
                                'たべる・たべもの',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                          SizedBox(
                            width: 30,
                            child: Icon(Icons.chevron_right_rounded,
                                color: Colors.brown // アイコンの色を設定できる
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //カテゴリ「食べ物」終わり
                //カテゴリ「からだ」はじまり
                SizedBox(
                  width: 30,
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    notifier.fetch(
                        searchType: SearchType.keyword,
                        keyWord:
                            'かさぶたくん おへそのひみつ あしにょきにょきにょき さっちゃんのまほうのて わたしのすてきなたびする目 歯がぬけた ミカちゃんのひだりて'); //TODO:orでクエリ絞り込みできる方法を調べる
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CategoryResultPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Icon(
                              Icons.directions_run,
                              color: Colors.brown,
                              size: 35.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          const SizedBox(
                              width: 250,
                              child: Text(
                                'からだ',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                          SizedBox(
                            width: 30,
                            child: Icon(Icons.chevron_right_rounded,
                                color: Colors.brown // アイコンの色を設定できる
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //カテゴリ「からだ」終わり
                //カテゴリ「いきもの・しょくぶつ」はじまり
                SizedBox(
                  width: 30,
                  height: 10,
                ),

                GestureDetector(
                  onTap: () {
                    notifier.fetch(
                        searchType: SearchType.keyword,
                        keyWord:
                            'なく虫ずかん せみとりめいじん イカタコつるつる ちいさいタネ さかなのなみだ だんまりこおろぎ むしのおんがくがっこう');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CategoryResultPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SizedBox(
                      height: 75,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 80,
                            child: Icon(
                              Icons.emoji_nature_sharp,
                              color: Colors.brown,
                              size: 35.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                          ),
                          const SizedBox(
                              width: 250,
                              child: Text(
                                'いきもの・しょくぶつ',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                          SizedBox(
                            width: 30,
                            child: Icon(Icons.chevron_right_rounded,
                                color: Colors.brown // アイコンの色を設定できる
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //カテゴリ「いきもの・しょくぶつ」終わり
              ],
            ),
          ],
        ),
      ),
    );
  }
}
