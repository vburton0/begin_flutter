import 'package:flutter/material.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Calculator',
      'Weather',
      'Training',
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('Groupp',
            style: TextStyle(color: Colors.white, fontSize: 28))));
    menuTitles.forEach((element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'Calculator':
                screen = BmiScreen();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
