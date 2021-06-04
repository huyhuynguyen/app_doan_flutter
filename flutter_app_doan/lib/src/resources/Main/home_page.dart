import 'package:flutter/material.dart';
import 'package:flutter_app_doan/constants.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/entypo_icons.dart';

class HomePage extends StatelessWidget {
  AuthBloc authBloc = new AuthBloc();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 245,
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
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                      Positioned(
                          top: 20,
                          left: 290,
                          child: Text(
                            "Lượng \ncalo cần \nnạp là\n750",
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 30
                            ),
                          ),
                      ),
                  ]
              ),
            ),
            ]
          )
        )

              // child: Container(
              //   child: Row(
              //   children: <Widget>[
              //       RichText(
              //           text: TextSpan(
              //             children: [
              //                 TextSpan(
              //                   text: "Case Update\n",
              //                   style: kTitleTextstyle,
              //                 ),
              //                 TextSpan(
              //                   text: "Newest update March 28",
              //                   style: TextStyle(
              //                     color: kTextLightColor,
              //                   ),
              //                 ),
              //             ],
              //           ),
              //       ),
              //       Spacer(),
              //       Text(
              //           "See details",
              //           style: TextStyle(
              //           color: kPrimaryColor,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ]
              //   ),
              // )
          ),
            Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Cân nặng: 45kg",
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 17,
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: authBloc.heightStream,
                        builder: (context, snapshot) {
                          return Container(
                            child: Text(
                              'Chiều cao: ${snapshot.data} cm',
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 17,
                              ),
                            ),
                          );
                        }
                      ),
                      ]
                    )
                  ),
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
                              Text(
                                "19.5",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: kInfectedColor,

                                ),
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
                              Text(
                                "527.0",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue[800],

                                ),
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
                              Text(
                                "632.0",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: kInfectedColor,

                                ),
                              ),
                              Text("TDEE", style: kSubTextStyle,)
                            ]
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
        //type here
      ]
      ),
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
