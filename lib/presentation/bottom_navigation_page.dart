import 'package:flutter/material.dart';
import 'package:picbook/presentation/enum/tab_item.dart';
import 'package:hexcolor/hexcolor.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.bookshelf: GlobalKey<NavigatorState>(),
  TabItem.mypage: GlobalKey<NavigatorState>(),
};

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  TabItem _currentTab = TabItem.bookshelf;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.bookshelf) {
            onSelect(TabItem.bookshelf);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: TabItem.values
              .map(
                (tabItem) => Offstage(
                  offstage: _currentTab != tabItem,
                  child: Navigator(
                    key: _navigatorKeys[tabItem],
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
          currentIndex: _currentTab.index,
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
            onSelect(TabItem.values[index]);
          },
        ),
      ),
    );
  }

  void onSelect(TabItem selectedTab) {
    if (_currentTab == selectedTab) {
      _navigatorKeys[selectedTab]
          ?.currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = selectedTab;
      });
    }
  }
}
