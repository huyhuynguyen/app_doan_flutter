import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_app_doan/dinh_duong_page.dart';
import 'package:flutter_app_doan/home_page.dart';
import 'package:flutter_app_doan/profile_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue), home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _currentIndex = 0;
  String _title="Home Page";

  final List<Widget> _tabs=[
    HomePage(),
    DinhDuongPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: _tabs[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Meal",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.blue),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch(_currentIndex) {
                case 0:
                  _title="Home Page";
                  break;
                case 1:
                  _title="Khẩu phần ăn";
                  break;
                case 2:
                  _title="Profile";
                  break;
              }
            });
          },
        ),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Theme.of(context).primaryColor,
        buttonSize: 66.0,
        curve: Curves.bounceInOut,

        icon: Icons.add,
        foregroundColor: Colors.white,
        activeIcon: Icons.close,
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.set_meal,
                color: Colors.white,
              ),
              backgroundColor: Colors.teal,
              label: "Thêm thực đơn",
              labelBackgroundColor: Colors.teal,
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
              onTap: () {}
          ),
          SpeedDialChild(
              child: Icon(
                Icons.fitness_center,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              label: "Tập luyện",
              labelBackgroundColor: Colors.red,
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
              onTap: () {}
          ),
          SpeedDialChild(
              child: Icon(
                Icons.calculate,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
              label: "Tính BMI",
              labelBackgroundColor: Colors.green,
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
              onTap: () {}
          ),
        ],
      ),
    );
  }
}
