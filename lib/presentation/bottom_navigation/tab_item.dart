import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picbook/presentation/bookshelf/book_shelf_page.dart';
import 'package:picbook/presentation/mypage/mypage.dart';
import '../../presentation/searchbook/searchbook_page.dart';

part 'tab_item.freezed.dart';

enum TabItem {
  bookshelf(
    title: '絵本の棚',
    icon: Icons.menu_book,
    page: BookShelfPage(),
  ),

  mypage(
    title: 'マイページ',
    icon: Icons.person,
    page: MyPage(),
  ),

  searchBook(
    title: '検索画面',
    icon: Icons.search,
    page: SearchBookPage(),
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

@freezed
class TabState with _$TabState {
  const TabState._();

  factory TabState({
    required TabItem item,
  }) = _TabState;
}
