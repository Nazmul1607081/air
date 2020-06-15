import 'package:flutter/material.dart';
import 'package:airdropbazarfinal/homepage.dart';
import 'package:airdropbazarfinal/hotairdrop.dart';
import 'package:airdropbazarfinal/update.dart';
import 'package:airdropbazarfinal/setting.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List _widgetOptions = [
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        selectedIconTheme: IconThemeData(color: Colors.black, opacity: 1),
        unselectedIconTheme: IconThemeData(color: Colors.black, opacity: .5),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
*  BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/a5.png"),color: Colors.red,),
            title: Text('রক্ত দিন',style: TextStyle(color: Colors.white),),
          ),*/
