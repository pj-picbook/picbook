import 'package:flutter/material.dart';
import 'package:picbook/domain/value/tab_item.dart';

final _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
  TabItem.bookshelf: GlobalKey<NavigatorState>(),
  TabItem.mypage: GlobalKey<NavigatorState>(),
};

class BottomNavigationPage extends StatefulWidget {
  BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  TabItem currentTab = TabItem.bookshelf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: TabItem.values
            .map(
              (tabItem) => Offstage(
                offstage: currentTab != tabItem,
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
        currentIndex: currentTab.index,
        items: TabItem.values
            .map(
              (tabItem) => BottomNavigationBarItem(
                icon: Icon(tabItem.icon),
                label: tabItem.title,
              ),
            )
            .toList(),
        onTap: (index) {
          final selectedTab = TabItem.values[index];
          if (currentTab == selectedTab) {
            _navigatorKeys[selectedTab]
                ?.currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              currentTab = selectedTab;
            });
          }
        },
      ),
    );
  }
}
