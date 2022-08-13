import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:picbook/presentation/bottom_navigation/tab_item.dart';

final bottomNavigationNotifierProvider =
    StateNotifierProvider<BottomNavigationNotifier, TabState>((ref) {
  return BottomNavigationNotifier();
});

///
class BottomNavigationNotifier extends StateNotifier<TabState> {
  final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
    TabItem.bookshelf: GlobalKey<NavigatorState>(),
    TabItem.mypage: GlobalKey<NavigatorState>(),
  };

  final logger = Logger();

  BottomNavigationNotifier() : super(TabState(item: TabItem.bookshelf));

  get navigatorKeys => _navigatorKeys;

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await _navigatorKeys[state.item]!.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (state.item != TabItem.bookshelf) {
        onSelect(TabItem.bookshelf);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  void onSelect(TabItem selectedTab) {
    logger.i('onTap');
    if (state.item == selectedTab) {
      logger.i('already selected');
      _navigatorKeys[selectedTab]
          ?.currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      logger.i('new tab');
      state = state.copyWith(item: selectedTab);
    }
  }
}
