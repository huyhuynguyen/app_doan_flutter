import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';

import 'package:flutter_app_doan/models/user.dart';
import 'package:flutter_app_doan/src/resources/Welcome/login.dart';
import 'package:flutter_app_doan/src/resources/dialog/loading_dialog.dart';
import 'package:flutter_app_doan/src/resources/dialog/msg_dialog.dart';
import 'input_infor.dart';


class WelcomeScreen extends StatelessWidget {
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
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 35.0),
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
                Container(
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
                SecondSignIn()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondSignIn extends StatefulWidget {
  @override
  _SecondSignInState createState() => _SecondSignInState();
}

class _SecondSignInState extends State<SecondSignIn> {
  AuthBloc authBloc = new AuthBloc();

  TextEditingController _emailController=new TextEditingController();
  TextEditingController _nameController=new TextEditingController();
  TextEditingController _yearOfBirthController=new TextEditingController();
  String valueChoose;
  List listItem =[
    "Nam", "Nữ"
  ];

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
                            controller: _emailController,
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
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16, right:16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54, width: 1),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: DropdownButton(
                              hint: Text("Chọn giới tính của bạn"),
                               dropdownColor: Colors.blue[100],
                               icon: Icon(Icons.arrow_drop_down),
                               iconSize: 36,
                               isExpanded: true,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 15
                               ),
                               value: valueChoose,
                              onChanged: (newValue){
                                 setState(() {
                                   valueChoose=newValue;
                                 });
                              },
                              items:listItem.map((valueItem){
                                return DropdownMenuItem(
                                 value: valueItem,
                                 child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: StreamBuilder(
                                stream: authBloc.genderStream,
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.hasError ? snapshot.error : "",
                                    style: TextStyle(
                                      color: Colors.red[800],
                                      fontSize: 14
                                    ),
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
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
                    // SizedBox(
                    //   height: 10.0,
                    // ),
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
    Map<String, dynamic> user = {
      "email": _emailController.text.trim(),
      "name": _nameController.text.trim(),
      "yearOfBirth": _yearOfBirthController.text.trim(),
      "gender": valueChoose,
    };

    print(user);

    if (authBloc.isValid(user)) {
      LoadingDialog.showLoadingDialog(context, "Welcome...");
      authBloc.signIn(user, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => input_infor()),
        );
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, "Error", msg);
      });

    }
  }
}
