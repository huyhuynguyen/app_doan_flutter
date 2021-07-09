import 'package:flutter/material.dart';
import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/blocs/add_tapluyen_bloc.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:flutter_app_doan/src/resources/Main/them_thuc_don.dart';
import 'package:flutter_app_doan/src/resources/Main/exercise_page.dart';
import 'package:flutter_app_doan/src/resources/Main/home_page.dart';
import 'package:flutter_app_doan/src/resources/Main/list_thuc_an_user.dart';
import 'package:flutter_app_doan/src/resources/Welcome/login.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dinh_duong_page.dart';
import 'profile_page.dart';

class ContainerMain extends StatefulWidget {
  final int indexTab;
  ContainerMain({this.indexTab});

  @override
  _ContainerMainState createState() => _ContainerMainState();
}

class _ContainerMainState extends State<ContainerMain> {
  int _currentIndex;
  PageController pageController;
  // String time="";
  // DateFormat dateFormat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex=widget.indexTab;
    pageChanged(_currentIndex);
    pageController = PageController(
        initialPage: _currentIndex,
        keepPage: true
    );
    // dateFormat = DateFormat("yyyy-MM-dd");
    // time=dateFormat.format(DateTime.now());
  }

  String _title="Home Page";
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _minuteController = new TextEditingController();
  TextEditingController _caloTapLuyenController = new TextEditingController();

  AuthBloc authBloc = new AuthBloc();
  CalcBloc calcBloc = new CalcBloc();

  createSimpleAlertDialog() {
    showDialog(context: context, useRootNavigator: false, builder: (context) {
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
                                    controller: _weightController,
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
                                    controller: _heightController,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onUpdateBMI,
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

  createAlertDialogForAddTapLuyen() {
    AddTapLuyenBloc addTapLuyenBloc = new AddTapLuyenBloc();
    showDialog(context: context, useRootNavigator: false, builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Thêm bài tập",
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child: StreamBuilder(
                                stream: addTapLuyenBloc.nameStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    controller: _nameController,
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                    decoration: InputDecoration(
                                        hintText: "Tên bài tập",
                                        contentPadding: const EdgeInsets.only(left: 5),
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child: StreamBuilder(
                                stream: addTapLuyenBloc.minuteStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    controller: _minuteController,
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "Số phút",
                                        contentPadding: const EdgeInsets.only(left: 5),
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                              child: StreamBuilder(
                                stream: addTapLuyenBloc.caloTapLuyenStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    controller: _caloTapLuyenController,
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "Calo bài tập",
                                        contentPadding: const EdgeInsets.only(left: 5),
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          _nameController.text="";
                          _minuteController.text="";
                          _caloTapLuyenController.text="";
                          Navigator.pop(context);
                        },
                        child: Text("Hủy")
                    ),
                    TextButton(
                        onPressed: (){
                          Map<String, dynamic> tapluyen = {
                            "name" : _nameController.text.trim(),
                            "time" : int.tryParse(_minuteController.text.trim()) ?? 0,
                            "calo" : int.tryParse(_caloTapLuyenController.text.trim()) ?? 0,
                          };
                          if (addTapLuyenBloc.isValidTapLuyen(tapluyen)) {
                            addTapLuyenBloc.addNewTapLuyenForUser(tapluyen, (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ContainerMain(indexTab: 2,))
                              );
                            });
                          }
                        },
                        child: Text("Thêm")
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }).then((exit) {
      if (exit==null || exit) {
        _nameController.text="";
        _minuteController.text="";
        _caloTapLuyenController.text="";
        addTapLuyenBloc.dispose();
        return;
      }
    });
  }

  // final List<Widget> _tabs=[
  //   HomePage(),
  //   DinhDuongPage(),
  //   ProfilePage(),
  //   ExercisePage()
  // ];


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authBloc.dispose();
    calcBloc.dispose();
  }

  void pageChanged(int index) {
    setState(() {
      _currentIndex=index;
      switch(_currentIndex) {
        case 0:
          _title="Home Page";
          break;
        case 1:
          _title="Khẩu phần ăn";
          break;
        case 2:
          _title="Exercise";
          break;
        case 3:
          _title="Profile";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: _atHomeOrNot()
        ),
        body:
        // Container(
        //   child: _tabs[_currentIndex],
        // ),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            pageChanged(index);
          },
          children: [
            HomePage(),
            DinhDuongPage(),
            ExercisePage(),
            ProfilePage(),
          ],
        ),
        floatingActionButton: (_currentIndex==0 || _currentIndex==3) ? SpeedDial(
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
                  Icons.fitness_center_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red[600],
                label: "Thêm tập luyện",
                labelBackgroundColor: Colors.red[600],
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
                onTap: () {
                  createAlertDialogForAddTapLuyen();
                }
            ),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThucDonPage()));
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
        ) : null,
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal_rounded),
                label: "Meal",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: "Exercise",
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
              pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease
              );
              switch(_currentIndex) {
                case 0:
                  _title="Home Page";
                  break;
                case 1:
                  _title="Khẩu phần ăn";
                  break;
                case 2:
                  _title="Exercise";
                  break;
                case 3:
                  _title="Profile";
                  break;
              }
            });
          },
        ),
      ),
    );
  }

  void onUpdateBMI() {
    authBloc.updateCurrentUser(int.parse(_heightController.text), int.parse(_weightController.text), () {
      GlobalList.setUpdateTime();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ContainerMain(indexTab: 0))
      );
    });
  }

  String _onChangeDateShow(AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData){
      GlobalList.time=snapshot.data;
    }
    return GlobalList.time;
  }

  void _addOneDay() {
    calcBloc.addOneDay(GlobalList.time);
    if (_currentIndex==0) {
      setState(() {

      });
    }
  }

  void _minusOneDay() {
    calcBloc.minusOneDay(GlobalList.time);
    if (_currentIndex==0) {
      setState(() {

      });
    }
  }

  List<Widget> _atHomeOrNot() {
    if (_currentIndex == 0 || _currentIndex == 1 || _currentIndex == 2) {
      calcBloc = new CalcBloc();
      return <Widget>[
        IconButton(
            iconSize: 20,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: _minusOneDay
        ),
        IconButton(
            icon: Icon(Icons.date_range),
            onPressed: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.parse(GlobalList.time),
                  firstDate: DateTime(2014),
                  lastDate: DateTime(2031)
              ).then((value) {
                calcBloc.getDayCalendar(value);
                setState(() {

                });
              });
            }
        ),
        Align(
            alignment: Alignment.center,
            child: StreamBuilder(
                stream: calcBloc.dateStream,
                builder: (context, snapshot) {
                  return Text(
                    '${_onChangeDateShow(snapshot)}',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  );
                }
            )
        ),
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: _addOneDay,
        ),
      ];
    }
    calcBloc.dispose();
    return [];
  }
}
