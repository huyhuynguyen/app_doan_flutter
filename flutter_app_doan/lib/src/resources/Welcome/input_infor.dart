import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';

import 'welcome_screen.dart';

class input_infor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //this size provide us total height and width of our screen
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("assets/images/background-firstPage.png"),
                  fit: BoxFit.cover,),
              ),
            ),
            // Image(
            //   image: AssetImage("assets/images/background-firstPage.png"),
            //   color: Colors.teal.shade400,
            //
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 65.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.blue[400],
                        child: Image(
                          image: AssetImage("assets/images/circle-avatar.png"),
                        )
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text("Bây giờ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40.0
                      ),
                    ),
                    Text(
                      "Hãy để mình biết thêm về bạn",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Material(
                  color: Colors.blue[400],
                  child:Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text("Hãy điền đầy đủ thông tin dưới đây nhé",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                secondInfor()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class secondInfor extends StatefulWidget {
  @override
  _secondInforState createState() => _secondInforState();
}

class _secondInforState extends State<secondInfor> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 35.0, right: 35.0),
      child: Stack(
        children: <Widget>[
          Form(
            child: Theme(
              data: ThemeData(
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                      )
                  )
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _weightController,
                        // autofocus: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.auto_awesome,color: Colors.white,),
                            hintText: "Cân nặng hiện tại của bạn"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _heightController,
                        // autofocus: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.pregnant_woman_sharp,color: Colors.white,),
                            hintText: "Chiều cao của bạn"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        // Home(height: double.tryParse(_heightController.text) ?? 0.0, weight: double.tryParse(_weightController.text) ?? 0.0)
                        width: 300.0,
                        child: FlatButton(
                            onPressed: _onGetToHome,
                            child: Text("Tiếp tục",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            color: Colors.blue[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(

                        width: 300.0,
                        child: FlatButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WelcomeScreen()),
                              );
                            },
                            child: Text("Quay lại",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            color: Colors.blue[700],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onGetToHome() {
    int height=int.parse(_heightController.text);
    int weight=int.parse(_weightController.text);

    authBloc.updateCurrentUser(height, weight, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContainerMain()),
      );
    });

  }
}
