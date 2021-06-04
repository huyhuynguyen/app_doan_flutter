import 'package:flutter/material.dart';
import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/resources/Main/exercise_page.dart';
import 'package:flutter_app_doan/src/resources/Main/home_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'dinh_duong_page.dart';
import 'profile_page.dart';
// import 'file:///D:/app_doan_flutter/flutter_app_doan/lib/src/resources/Main/dinh_duong_page.dart';
// import 'file:///D:/app_doan_flutter/flutter_app_doan/lib/src/resources/Main/home_page.dart';
// import 'file:///D:/app_doan_flutter/flutter_app_doan/lib/src/resources/Main/profile_page.dart';

class ContainerMain extends StatefulWidget {
  @override
  _ContainerMainState createState() => _ContainerMainState();
}

class _ContainerMainState extends State<ContainerMain> {
  int _currentIndex = 0;
  String _title="Home Page";

  createSimpleAlertDialog() {
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cập nhật BMI",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Row(
                              children: [
                                Text(
                                  "Cân nặng của bạn",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1,
                                          color: Color(0xFFBBBBBB)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            offset: Offset(0, 2),
                                            blurRadius: 2
                                        )
                                      ]
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  width: 40,
                                  child: TextField(
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "0",
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(left: 5)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "kg",
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Row(
                              children: [
                                Text(
                                  "Chiều cao của bạn",
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1,
                                          color: Color(0xFFBBBBBB)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            offset: Offset(0, 2),
                                            blurRadius: 2
                                        )
                                      ]
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                                  width: 40,
                                  child: TextField(
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "0",
                                        border: InputBorder.none,
                                        contentPadding: const EdgeInsets.only(left: 5)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "cm",
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    //   child: Column(
                    //     children: [
                    //       Align(
                    //         alignment: Alignment.centerLeft,
                    //         child: Text(
                    //           "Nhóm vận động",
                    //           style: TextStyle(
                    //               fontSize: 18
                    //           ),
                    //         ),
                    //       ),
                    //       Column(
                    //         children: [
                    //           ListTile(
                    //             title: Text(
                    //               "Vận động ít",
                    //               style: TextStyle(
                    //                   fontSize: 18
                    //               ),
                    //             ),
                    //             leading: Radio(
                    //
                    //             ),
                    //           ),
                    //           ListTile(
                    //             title: Text(
                    //               "Vận động trung bình",
                    //               style: TextStyle(
                    //                   fontSize: 18
                    //               ),
                    //             ),
                    //           ),
                    //           ListTile(
                    //             title: Text(
                    //               "Vận động cao",
                    //               style: TextStyle(
                    //                   fontSize: 18
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Tính BMI",
                        style: TextStyle(
                            fontSize: 16
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  final List<Widget> _tabs=[
    HomePage(),
    DinhDuongPage(),
    ProfilePage(),
    ExercisePage()
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
              onTap: () {createSimpleAlertDialog();
              }
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
              onTap: () {
                createSimpleAlertDialog();
              }
          ),
        ],
      ),
    );;
  }
}
