import 'package:flutter/material.dart';
import 'package:flutter_app_doan/detail_dinh_duong_page.dart';
import 'package:flutter_app_doan/fake_data.dart';

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
              child: ListView.builder(
                  itemCount: FAKE_THUC_AN.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailDinhDuongPage(food: FAKE_THUC_AN[index],)
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
                                    FAKE_THUC_AN[index].name,
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
                                  '${FAKE_THUC_AN[index].soluong} ${FAKE_THUC_AN[index].donvitinh}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '${FAKE_THUC_AN[index].calo} calo',
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
              )
          )
        ],
      ),
    );
  }
}
