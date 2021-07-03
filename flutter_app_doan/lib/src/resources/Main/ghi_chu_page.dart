import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/resources/Main/list_ghi_chu.dart';
import 'package:flutter_app_doan/src/resources/Main/them_edit_ghi_chu.dart';

class GhiChuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xem tất cả ghi chú"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemEditGhiChu(title: "Thêm", keyAction: "add",))
                );
              }
          )
        ],
      ),
      body: Container(
        child: ListGhiChu()
      ),
    );
  }
}
