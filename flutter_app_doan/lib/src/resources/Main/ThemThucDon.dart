import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:fluttericon/fontelico_icons.dart';

import '../../../models/user.dart';

class ThucDonPage extends StatefulWidget {
  @override
  _ThucDonPageState createState() => _ThucDonPageState();
}

class _ThucDonPageState extends State<ThucDonPage> {
  var _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm thực đơn"),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            SizedBox(height: 30,),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    "Nhập thông tin món ăn",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[800]
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Tên món",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "chất béo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "calo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 90, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "carbs",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 80, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Đơn vị tính",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 35, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Protein",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 65, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Số lượng",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Thêm thực đơn', style: TextStyle(fontSize: 20.0),),
                minWidth: 350,
                height: 45,
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}