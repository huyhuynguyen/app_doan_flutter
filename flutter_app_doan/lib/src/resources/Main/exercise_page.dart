import 'package:flutter/material.dart';

import 'package:flutter_app_doan/fake_data.dart';

import 'list_exercise.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  var _searchController=TextEditingController();

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
          Expanded(
              child: ListExercise(searchText: _searchController.text)
          )
        ],
      ),
    );
  }
}
