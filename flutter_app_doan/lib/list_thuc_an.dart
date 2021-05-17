import 'package:flutter/material.dart';
import 'package:flutter_app_doan/fake_data.dart';
import 'package:flutter_app_doan/models/thuc_an.dart';

import 'detail_dinh_duong_page.dart';

class ListThucAn extends StatelessWidget {
  String searchText;
  ListThucAn({this.searchText});

  @override
  Widget build(BuildContext context) {

    // tạo 1 list cho search và 1 list full nếu không nhập gì trong thanh search
    List<ThucAn> listThucAnForSearch=FAKE_THUC_AN.where((thucAn) => thucAn.name.toLowerCase().contains(this.searchText.trim().toLowerCase())).toList();
    List<ThucAn> listThucAnFull=FAKE_THUC_AN.toList();
    return Container(
      // nếu nhập có dữ liệu hoặc chưa nhập gì
      child: (listThucAnForSearch.length>0 || this.searchText.trim()=="") ? ListView.builder(
          // nếu chưa nhập sẽ hiển thị full ThucAn
          itemCount: (this.searchText.trim()=="") ? listThucAnFull.length : listThucAnForSearch.length,
          itemBuilder: (context, item) {
            ThucAn thucAn=listThucAnForSearch[item];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailDinhDuongPage(food: thucAn,)
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
                            thucAn.name,
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
                          '${thucAn.soluong} ${thucAn.donvitinh}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${thucAn.calo} calo',
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
            );
          }
      ) :
          Center(
            child: Text("Nothing found"),
          )
    );
  }
}
