import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/widgets/nofitication_bell.dart';

class StationPage extends StatelessWidget {
  final Results station;
  int currentPageIndex = 0;

  StationPage({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      bottomNavigationBar: bottomNavigationBar(context),
      body: Column(
        children: [
          Text(
            station.name,
            style: themeData.textTheme.displaySmall,
          ),
          Text(
            station.address.line1,
            style: themeData.textTheme.labelSmall,
          )
        ],
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

  void setState(Null Function() param0) {}
}
