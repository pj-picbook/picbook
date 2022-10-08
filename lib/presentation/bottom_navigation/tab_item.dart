import 'package:flutter/material.dart';
import 'package:picbook/presentation/bookshelf/bookshelf_page.dart';
import 'package:picbook/presentation/mypage/mypage.dart';
import 'package:picbook/presentation/stamp/stamp_page.dart';

enum TabItem {
  bookshelf(
    title: '絵本の棚',
    icon: Icons.menu_book,
    page: BookshelfPage(),
  ),

  stamp(
    title: '読んだスタンプ',
    icon: Icons.sentiment_very_satisfied,
    page: StampPage(),
  ),

  mypage(
    title: 'マイページ',
    icon: Icons.person,
    page: MyPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}
