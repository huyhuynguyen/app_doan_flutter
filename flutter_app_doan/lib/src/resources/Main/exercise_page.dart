import 'package:flutter/material.dart';

import 'package:flutter_app_doan/fake_data.dart';
import 'package:flutter_app_doan/src/blocs/item_checked_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';

import 'list_exercise.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  var _searchController=TextEditingController();
  ItemCheckedBloc itemCheckedBloc = new ItemCheckedBloc();

  createConfirmDialog() {
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
                      "Confirm to add ThucAn",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    )
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("You choose"),
                    Column(
                        children: itemCheckedBloc.listExerciseDaChon()
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("Edit"),
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14
                          )
                      ),
                    ),
                    TextButton(
                      onPressed: _onConfirmToAddListTapLuyen,
                      child: Text("OK"),
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 14
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GlobalList.tapLuyenDaChon=[];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Colors.blue
                    )
                )
            ),
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: TextField(
              onChanged: (text) {
                setState(() {

                });
              },
              controller: _searchController,
              // autofocus: true,
              style: TextStyle(
                  fontSize: 20
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                hintText: "Tìm kiếm",
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
              onPressed: (){
                createConfirmDialog();
              },
              child: Text(
                "Click to add",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
            ),
          ),
          Expanded(
              child: ListExercise(searchText: _searchController.text)
          )
        ],
      ),
    );
  }

  void _onConfirmToAddListTapLuyen() {
    if (GlobalList.tapLuyenDaChon.length>0) {
      itemCheckedBloc.addlistTapLuyenDaChon((){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContainerMain(indexTab: 0,))
        );
      });
    }
    else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Nothing to add')
          )
      );
    }
  }
}
