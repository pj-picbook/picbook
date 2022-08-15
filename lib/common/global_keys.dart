import 'package:flutter/material.dart';

import '../presentation/bottom_navigation/tab_item.dart';

final navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.bookshelf: GlobalKey<NavigatorState>(),
  TabItem.mypage: GlobalKey<NavigatorState>(),
};
