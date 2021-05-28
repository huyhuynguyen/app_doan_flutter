import 'package:flutter/material.dart';
import 'package:flutter_app_doan/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 250,
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
                image: AssetImage("assets/images/virus.png"),
              ),
            ),
            child: Column(

              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  // child: Image.asset(
                  //   'assets/images/yoga.png',
                  //   width: 110.0,
                  //   height: 100.0,
                  //   fit: BoxFit.fill,
                  //   ),
                  child: Stack(
                    children: <Widget>[
                    // SvgPicture.asset(
                    //     "assets/images/yoga.png",
                    //   width: 230,
                    //   fit: BoxFit.fitWidth,
                    //   alignment: Alignment.topCenter,
                    // ),
                    Positioned(
                        top: 20,
                        left: 200,
                        child: Text(
                          "Lượng \ncalo cần \nnạp là\n750",
                          style: kHeadingTextStyle.copyWith(
                              color: Colors.white,
                              // fontSize: 20
                          ),
                        )
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
                SizedBox(height: 5),
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
                                color: Colors.lightBlue[100],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.blue[800],
                                      width: 2,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "45 Kg",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue[800],

                              ),
                            ),
                            Text("Cân nặng", style: kSubTextStyle,)
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
                                      color: Colors.blue[800],
                                      width: 2,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "152 cm",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.blue[800],

                              ),
                            ),
                            Text("Chiều cao", style: kSubTextStyle,)
                          ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      //type here
    ]
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
