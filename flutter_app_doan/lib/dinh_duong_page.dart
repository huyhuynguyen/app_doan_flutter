import 'package:flutter/material.dart';
import 'package:flutter_app_doan/detail_dinh_duong_page.dart';
import 'package:flutter_app_doan/fake_data.dart';
import 'package:flutter_app_doan/list_thuc_an.dart';

class DinhDuongPage extends StatefulWidget {
  @override
  _DinhDuongPageState createState() => _DinhDuongPageState();
}

class _DinhDuongPageState extends State<DinhDuongPage> {
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
              child: ListThucAn(searchText: _searchController.text)
          )
        ],
      ),
    );
  }
}
