import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_doan/constants.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/list_exercise_user.dart';
import 'package:flutter_app_doan/src/resources/Main/list_thuc_an.dart';
import 'package:flutter_app_doan/src/resources/Main/list_thuc_an_user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/entypo_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc authBloc = new AuthBloc();
  ListBloc _listBloc = new ListBloc();
  CalcBloc calcBloc = new CalcBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
                clipper: MyClipper(),
                child: Container(
                    height: 300,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF3383CD),
                          Color(0xFF11249F),
                        ],
                      ),

                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/physical-exercise.png"
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 20,
                                left: 290,
                                child: FutureBuilder(
                                  future: calcBloc.TDEECalc(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      return Text(
                                          'Lượng \ncalo cần \nnạp là\n${snapshot.data}',
                                          style: kHeadingTextStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: 25
                                        ),
                                      );
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                             ),
                            ]
                          ),
                        ),
                      ]
                    )
                )
              ),
            Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column( 
                children: <Widget>[
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Container(
                              child: FutureBuilder(
                                future: authBloc.getValueUser('weight'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return Text(
                                      'Cân nặng: ${snapshot.data} kg',
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontSize: 20,
                                      ),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child: FutureBuilder(
                                future: authBloc.getValueUser('height'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return Text(
                                      'Chiều cao: ${snapshot.data} cm',
                                      style: TextStyle(
                                        color: Colors.blue[800],
                                        fontSize: 20,
                                      ),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                            )
                            ]
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 30,
                                        color: kShadowColor,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          SizedBox(height: 10),
                                          Container(
                                            child: FutureBuilder(
                                                future: _listBloc.caloDay(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState == ConnectionState.done) {
                                                    String caloDay = snapshot.data.toStringAsFixed(0);
                                                    return Text(
                                                      caloDay,
                                                      style: TextStyle(
                                                        color: Colors.deepOrangeAccent,
                                                        fontSize: 35,
                                                      ),
                                                    );
                                                  }
                                                  return CircularProgressIndicator();
                                              },
                                            ),
                                          ),
                                          Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                child: Text(
                                                  'calo day',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              )
                                          )
                                    ],
                                  ),
                                  ]
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 5),
                  Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kInfectedColor.withOpacity(.26),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color: kInfectedColor,
                                            width: 2,
                                          )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    FutureBuilder(
                                      future: calcBloc.BMICalc(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          return Text(
                                            snapshot.data.toString(),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kInfectedColor,
                                            ),
                                          );
                                        }
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                    Text("BMI", style: kSubTextStyle,)
                                  ]
                              ),
                              Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlue[100],
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                            border: Border.all(
                                            color:  Colors.blue[800],
                                            width: 2,
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    FutureBuilder(
                                      future: calcBloc.BMRCalc(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          return Text(
                                            snapshot.data.toString(),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.blue[800],
                                            ),
                                          );
                                        }
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                    Text("BMR", style: kSubTextStyle,)
                                  ]
                              ),
                              Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kInfectedColor.withOpacity(.26),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: kInfectedColor,
                                              width: 2,
                                            )
                                        ),
                                        ),
                                      ),
                                    SizedBox(height: 10),
                                    FutureBuilder(
                                      future: calcBloc.TDEECalc(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          return Text(
                                            snapshot.data.toString(),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: kInfectedColor,

                                            ),
                                          );
                                        }
                                        return CircularProgressIndicator();
                                      },
                                    ),
                                    Text("TDEE", style: kSubTextStyle,)
                                  ]
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "Nhật ký trong ngày",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFA5A5A5)
                                ),
                              ),
                              FutureBuilder(
                                future: _listBloc.sumOfCaloThucAnUser(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    String caloText=snapshot.data.toStringAsFixed(0);
                                    return Text(
                                      '$caloText calo',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFA5A5A5)
                                      ),
                                    );
                                  }
                                  return CircularProgressIndicator();
                                }
                              )
                            ],
                          ),
                        ),
                        ListThucAnUser(),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Tập luyện trong ngày",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFA5A5A5)
                                ),
                              ),
                              FutureBuilder(
                                  future: _listBloc.sumOfCaloTapluyenUser(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      String caloText=snapshot.data.toStringAsFixed(0);
                                      return Text(
                                        '$caloText calo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFFA5A5A5)
                                        ),
                                      );
                                    }
                                    return CircularProgressIndicator();
                                  }
                              )
                            ],
                          ),
                        ),
                        ListExerciseUser(),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 70),
                          padding: EdgeInsets.all(20),
                          height: 185,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/images/banner-app.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ],
              ),
            ),
        ),
          ]
        ),
      )
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-80);
    path.quadraticBezierTo(
        size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
