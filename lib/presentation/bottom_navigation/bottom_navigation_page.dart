import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/presentation/bottom_navigation/bottom_navigation_notifier.dart';

import 'tab_item.dart';

class BottomNavigationPage extends HookConsumerWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(bottomNavigationNotifierProvider);
    final notifier = ref.read(bottomNavigationNotifierProvider.notifier);

    return WillPopScope(
      onWillPop: () async => await notifier.onWillPop(),
      child: Scaffold(
        body: Stack(
          children: TabItem.values
              .map(
                (tabItem) => Offstage(
                  offstage: state.item != tabItem,
                  child: Navigator(
                    key: notifier.navigatorKeys[tabItem],
                    onGenerateRoute: (settings) {
                      return MaterialPageRoute<Widget>(
                        builder: (context) => tabItem.page,
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.item.index,
          backgroundColor: HexColor('DBCCC4'),
          items: TabItem.values
              .map(
                (tabItem) => BottomNavigationBarItem(
                  icon: Icon(tabItem.icon),
                  label: tabItem.title,
                ),
              )
              .toList(),
          onTap: (index) {
            notifier.onSelect(TabItem.values[index]);
          },
        ),
      ),
    );
  }
}
