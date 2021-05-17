import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';

import 'models/user.dart';

class ProfilePage extends StatelessWidget {
  User user;
  ProfilePage({this.user});
  DateTime now=new DateTime.now();
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
                            fontSize: 25
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
                                      child: Text(
                                        "Nguyen Van A",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
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
                                    "Năm sinh",
                                    style: TextStyle(
                                        fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "2000",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
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
                                    "Số điện thoại",
                                    style: TextStyle(
                                        fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "038383222",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
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
                              fontSize: 25
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
                                        child: Text(
                                          "22.5",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 25
                                          ),
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
                                          Container(
                                            margin: const EdgeInsets.only(top: 2),
                                            child: Text(
                                                '$now',
                                              style: TextStyle(
                                                fontSize: 16
                                              ),
                                            ),
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
                                        child: Text(
                                          "45.0 kg",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                            color: Colors.green
                                          ),
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
                                            child: Text(
                                              "152.0 cm",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.green
                                              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
