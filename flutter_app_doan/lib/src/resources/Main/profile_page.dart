import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/ghi_chu_page.dart';
import 'package:flutter_app_doan/src/resources/Welcome/login.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:intl/intl.dart';

import '../../../models/user.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthBloc authBloc = new AuthBloc();

  CalcBloc calcBloc = new CalcBloc();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: 220,
                      child: Image.asset(
                          'assets/images/circle-avatar.png',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                                "Thành viên vàng",
                                style: TextStyle(
                                  fontSize: 20
                                ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Fontelico.crown,
                                  size: 30,
                                  color: Colors.yellow[700],
                                ),
                                Icon(
                                  Fontelico.crown,
                                  size: 30,
                                  color: Colors.yellow[700],
                                ),
                                Icon(
                                  Fontelico.crown,
                                  size: 30,
                                  color: Colors.yellow[700],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    )
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Thông tin cơ bản",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFBBBBBB)
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                              blurRadius: 2
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Họ và tên",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FutureBuilder(
                                        future: authBloc.getValueUser('name'),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            return Text(
                                              snapshot.data,
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            );
                                          }
                                          return CircularProgressIndicator();
                                        },
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Tuổi",
                                    style: TextStyle(
                                        fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FutureBuilder(
                                        future: authBloc.getValueUser('age'),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            return Text(
                                              snapshot.data,
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            );
                                          }
                                          return CircularProgressIndicator();
                                        },
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Giới tính",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FutureBuilder(
                                        future: authBloc.getValueUser('gender'),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            return Text(
                                              snapshot.data,
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            );
                                          }
                                          return CircularProgressIndicator();
                                        },
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Thông tin BMI",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: Color(0xFFBBBBBB)
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              offset: Offset(0, 2),
                              blurRadius: 2
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                            "BMI",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: FutureBuilder(
                                          future: calcBloc.BMICalc(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.done) {
                                              return Text(
                                                snapshot.data.toString(),
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 25
                                                ),
                                              );
                                            }
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "Lần cuối cập nhật",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ),
                                          FutureBuilder(
                                            future: GlobalList.getUpdateTime(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.done) {
                                                print(snapshot.data);
                                                return Text(
                                                  snapshot.data.toString(),
                                                  style: TextStyle(
                                                      fontSize: 16
                                                  ),
                                                );
                                              }
                                              return CircularProgressIndicator();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                            "Cân nặng",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: FutureBuilder(
                                          future: authBloc.getValueUser('weight'),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.done) {
                                              return Text(
                                                '${snapshot.data} kg',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.green
                                                ),
                                              );
                                            }
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "Chiều cao",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: FutureBuilder(
                                              future: authBloc.getValueUser('height'),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.done) {
                                                  return Text(
                                                    '${snapshot.data} cm',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.w900,
                                                        color: Colors.green
                                                    ),
                                                  );
                                                }
                                                return CircularProgressIndicator();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GhiChuPage())
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.event_note_rounded),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "Xem ghi chú",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                          "Đánh giá ứng dụng này",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 35,
                            icon: Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                            ),
                            onPressed: (){

                            }
                        ),
                        IconButton(
                            iconSize: 35,
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                            ),
                            onPressed: (){

                            }
                        ),
                        IconButton(
                            iconSize: 35,
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                            ),
                            onPressed: (){

                            }
                        ),
                        IconButton(
                            iconSize: 35,
                            icon: Icon(
                              Icons.star,
                              color: Colors.yellow[600],
                            ),
                            onPressed: (){

                            }
                        ),
                        IconButton(
                            iconSize: 35,
                            icon: Icon(Icons.star_border),
                            onPressed: (){}
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 80, left: 20, right: 20),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: (){
                    authBloc.logOut(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
