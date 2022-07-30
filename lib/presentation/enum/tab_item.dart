import 'package:flutter/material.dart';
import 'package:picbook/presentation/bookshelf/bookshelf_page.dart';
import 'package:picbook/presentation/mypage/mypage.dart';

enum TabItem {
  bookshelf(
    title: '絵本の棚',
    icon: Icons.menu_book,
    page: BookshelfPage(), // TODO:絵本の棚のクラス名に書き換える。
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
