import 'package:flutter/material.dart';
import 'package:fuelwise/pages/home_page.dart';
import 'package:fuelwise/pages/saved_stations.dart';
import 'package:fuelwise/pages/search_page.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Pages
  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const SavedStationsPage()
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      bottomNavigationBar: bottomNavigationBar(context),
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
    );
  }

  NavigationBar bottomNavigationBar(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Theme.of(context).navigationBarTheme.indicatorColor,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.search_outlined)),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.pin_drop_rounded),
          ),
          label: 'Saved Locations',
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
      ),
      centerTitle: true,
      title: const Text("Fuel Wise"),
      actions: [
        NotificationBell(),
      ],
    );
  }
}
