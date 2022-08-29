import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rootllyai/pages/home_page.dart';
import 'package:rootllyai/pages/rehab_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  PersistentTabController _controller = PersistentTabController();

  List<Widget> _pages() {
    return [
      HomePage(),
      RehabPage(),
      const Text('Practice'),
      const Text('Profile')
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.calendar),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.elderly),
          title: ("Rehab"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.compass),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.person),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.black,
          inactiveColorPrimary: CupertinoColors.systemGrey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _pages(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.grey.shade300,
      navBarStyle: NavBarStyle.style3,
      navBarHeight: 65,
      padding: const NavBarPadding.only(bottom: 15.0),
    );
  }
}
