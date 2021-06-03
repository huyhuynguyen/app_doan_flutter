import 'package:flutter/material.dart';
import 'package:flutter_app_doan/models/thuc_an.dart';

class DetailDinhDuongPage extends StatefulWidget {
  ThucAn food;
  DetailDinhDuongPage({this.food});

  @override
  _DetailDinhDuongPageState createState() => _DetailDinhDuongPageState();
}

class _DetailDinhDuongPageState extends State<DetailDinhDuongPage> {
  // get instance food variable
  TextEditingController get _soluongController => TextEditingController(text: widget.food.soluong.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.food.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        child: Align(
                          child: Text(
                            "Thành phần dinh dưỡng",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFBBBBBB)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      offset: Offset(0, 2),
                                      blurRadius: 2
                                  )
                                ],
                              ),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 18
                                ),
                                keyboardType: TextInputType.number,
                                controller: _soluongController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                  hintText: "value",
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5)
                            ),
                            Text(
                              this.widget.food.donvitinh,
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                            Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${this.widget.food.calo} calo',
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Chi tiết các thành phần",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFBBBBBB)
                          ),
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
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Đạm",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${this.widget.food.dam} g',
                                          style: TextStyle(
                                            fontSize: 20
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Béo",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${this.widget.food.beo} g',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Carbs",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${this.widget.food.carbs} g',
                                          style: TextStyle(
                                              fontSize: 20
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 55,
                    width: 260,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      onPressed: () {

                      },
                      child: Text(
                          "Thêm vào nhật ký",
                        style: TextStyle(
                          fontSize: 22
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
