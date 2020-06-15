import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:airdropbazarfinal/homepage.dart';
import 'package:airdropbazarfinal/bottomnavigation.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:airdropbazarfinal/hotairdrop.dart';
import 'package:airdropbazarfinal/update.dart';
import 'package:airdropbazarfinal/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  List<Widget> _widgetOptions = [
    Container(
      child: HomePage(),
    ),
    Container(
      child: HotAirDrop(),
    ),
    Container(
      child: Update(),
    ),
    Container(
      child: Setting(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScaffold(
        scaffold: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            selectedIconTheme: IconThemeData(color: Colors.black, opacity: 1),
            unselectedIconTheme:
                IconThemeData(color: Colors.black, opacity: .5),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/homeicon.png")),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage("images/hotairicon.png"),
                  height: 24,
                  width: 24,
                ),
                title: Text(
                  'HotAirDrop',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                title: Text(
                  'Update ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                title: Text(
                  'Settings ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        children: _widgetOptions,
      ),
    );
  }
}
