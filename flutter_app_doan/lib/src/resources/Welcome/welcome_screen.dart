import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';

import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/resources/Welcome/login.dart';
import 'input_infor.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    //this size provide us total height and width of our screen
    return MaterialApp(
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
                    Text("Xin chào",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0
                      ),
                    ),
                    Text(
                      "Chào mừng đến với Lười",
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
                      Text("Hãy điền đầy đủ thông tin để bắt đầu đăng ký nhé <3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                ),
                secondSignIn()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class secondSignIn extends StatefulWidget {
  @override
  _secondSignInState createState() => _secondSignInState();
}

class _secondSignInState extends State<secondSignIn> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _nameController=new TextEditingController();
  TextEditingController _yearOfBirthController=new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    authBloc.dispose();
    super.dispose();
  }

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
                      child: StreamBuilder(
                        stream: authBloc.phoneStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _phoneController,
                            // autofocus: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              errorText: snapshot.hasError ? snapshot.error : null,
                              prefixIcon: Icon(Icons.mail_outline,color: Colors.white,),
                              hintText: "Nhập email của bạn"
                            ),
                            keyboardType: TextInputType.multiline,
                          );
                        }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder(
                        stream: authBloc.nameStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _nameController,
                            // autofocus: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                prefixIcon: Icon(Icons.people,color: Colors.white,),
                                hintText: "Bạn tên là gì"
                            ),
                            keyboardType: TextInputType.multiline,
                          );
                        }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: StreamBuilder(
                        stream: authBloc.yearOfBirthStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _yearOfBirthController,
                            // autofocus: true,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                prefixIcon: Icon(Icons.people,color: Colors.white,),
                                hintText: "Năm sinh của bạn",
                            ),

                            keyboardType: TextInputType.number,
                          );
                        }
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(

                        width: 300.0,
                        child: FlatButton(
                            onPressed: _onSignIn,
                            child: Text("Đăng ký",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                          color: Colors.blue[700],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(

                        width: 300.0,
                        child: FlatButton(
                            onPressed: (){
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage()),
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

  void _onSignIn() {
    User user=new User(
        phoneNumber: _phoneController.text.trim(),
        name: _nameController.text.trim(),
        yearOfBirth: _yearOfBirthController.text.trim()
    );

    if (authBloc.isValid(user)) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => input_infor()),
      );
    }
  }
}
