import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AddFruitPage.dart';
import 'HomePage.dart';
import 'ItemsFruitPage.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<NavigationController>(context);
    return Scaffold(
      body: Consumer<NavigationController>(
        builder: (context, navigationProvider, child) {
          return navigationProvider
              .items[navigationProvider.selectedIndex].widget!;
        },
      ),
      bottomNavigationBar: Consumer<NavigationController>(
        builder: (context, navigationProvider, child) {
          return NavigationBar(
            backgroundColor: Colors.white,
            indicatorColor: Color.fromARGB(255, 3, 123, 49),
            selectedIndex: navigationProvider.selectedIndex,
            onDestinationSelected: (int index) {
              navigationProvider.selectedIndex = index;
            },
            destinations: navigationProvider.items.asMap().entries.map((entry) {
              int idx = entry.key;
              NavigationModel item = entry.value;
              Color iconColor = navigationProvider.selectedIndex == idx
                  ? Colors.white
                  : Colors.black;

              return NavigationDestination(
                icon: Icon(item.iconData, color: iconColor),
                label: item.label!,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class NavigationController with ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<NavigationModel> items = [
    NavigationModel(label: "Home", widget: Homepage(), iconData: Icons.home),
    NavigationModel(label: "Add", widget: AddFruitPage(), iconData: Icons.add),
    NavigationModel(
        label: "Items",
        widget: ItemsFruitPage(),
        iconData: Icons.apps_outlined),
  ];

  int select = 0;
  int get selectedIndex => select;

  set selectedIndex(int value) {
    select = value;
    notifyListeners();
  }
}

class NavigationModel {
  Widget? widget;
  String? label;
  IconData? iconData;

  NavigationModel({this.widget, this.label, this.iconData});
}
