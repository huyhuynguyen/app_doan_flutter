import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/detail_dinh_duong_page.dart';

class ListThucAnUser extends StatelessWidget {
  final ListBloc listBloc = new ListBloc();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: listBloc.getListThucAnForUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            // nếu nhập có dữ liệu hoặc chưa nhập gì
              child: (snapshot.data.length>0) ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                // nếu chưa nhập sẽ hiển thị full ThucAn
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, item) {
                    Map<String, dynamic> thucAn=snapshot.data[item];
                    return InkWell(
                      onTap: () {
                        // print(thucAn.toString());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailDinhDuongPage(food: thucAn, btnTitle: "Cập nhật nhật ký", keyFunctionBtn: "Update",)
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
                                  '${thucAn["soluong"]} ${thucAn["donvitinh"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '${thucAn["calo"]} calo',
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
        return CircularProgressIndicator();
      },
    );
  }
}
