import 'package:flutter/material.dart';
import 'package:flutter_app_doan/fake_data.dart';
import 'package:flutter_app_doan/models/thuc_an.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/selected_tick.dart';

import 'detail_dinh_duong_page.dart';

class ListThucAnThem extends StatefulWidget {
  String searchText;
  ListThucAnThem({this.searchText});

  @override
  _ListThucAnThemState createState() => _ListThucAnThemState();
}

class _ListThucAnThemState extends State<ListThucAnThem> {
  ListBloc listBloc = new ListBloc();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: listBloc.getListThucAnThem(this.widget.searchText),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            // nếu nhập có dữ liệu hoặc chưa nhập gì
              child: (snapshot.data.length>0 || this.widget.searchText.trim()=="") ? ListView.builder(
                // nếu chưa nhập sẽ hiển thị full ThucAnThem
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, item) {
                    Map<String, dynamic> thucAn = snapshot.data[item];
                    return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailDinhDuongPage(food: thucAn, btnTitle: "Thêm vào nhật ký", keyFunctionBtn: "Add",)
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      offset: Offset(0, 2),
                                      blurRadius: 2
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1,
                                    color: Color(0xFFBBBBBB)
                                )
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    child: Align(
                                      child: Text(
                                        thucAn["name"],
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    )
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '${thucAn["soluong"].toStringAsFixed(0)} ${thucAn["donvitinh"]}',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '${thucAn["calo"].toStringAsFixed(0)} calo',
                                            style: TextStyle(
                                                fontSize: 18
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SelectedTick(item: thucAn, keyWord: "ThucAn",),
                      ],
                    );
                  }
              ) :
              Center(
                child: Text("Nothing found"),
              )
          );
        }
        return CircularProgressIndicator();
      },
    );
  }


}
