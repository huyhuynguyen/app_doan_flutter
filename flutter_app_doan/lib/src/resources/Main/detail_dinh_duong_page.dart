import 'package:flutter/material.dart';
import 'package:flutter_app_doan/models/thuc_an.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';
import 'package:flutter_app_doan/src/resources/Main/home_page.dart';


class DetailDinhDuongPage extends StatefulWidget {
  Map<String, dynamic> food;
  String btnTitle;
  String keyFunctionBtn;
  DetailDinhDuongPage({this.food, this.btnTitle, this.keyFunctionBtn});

  @override
  _DetailDinhDuongPageState createState() => _DetailDinhDuongPageState();
}

class _DetailDinhDuongPageState extends State<DetailDinhDuongPage> {
  CalcBloc calcBloc = new CalcBloc();
  ListBloc listBloc = new ListBloc();

  // get instance food variable
  TextEditingController get _soluongController => TextEditingController(text: widget.food["soluong"].toString());
  double get proteinIni => widget.food["protein"]+.0;
  double get beoIni => widget.food["beo"]+.0;
  double get carbsIni => widget.food["carbs"]+.0;
  int get caloIni => widget.food["calo"];

  Map<String, dynamic> maps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maps= new Map.from(widget.food);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    calcBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.food["name"]),
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
                                onChanged: _onCountChange,
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
                              this.widget.food["donvitinh"],
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                            Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: StreamBuilder(
                                    stream: calcBloc.caloStream,
                                    builder: (context, snapshot) {
                                      return Text(
                                        '${_onChangeDataOrNot(snapshot, this.widget.food["calo"], "calo")} calo',
                                        // '${snapshot.hasData ? snapshot.data : this.widget.food["calo"]} calo',
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                      );
                                    }
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
                                      "Protein",
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: StreamBuilder(
                                          stream: calcBloc.proteinStream,
                                          builder: (context, snapshot) {
                                            return Text(
                                              '${_onChangeDataOrNot(snapshot, this.widget.food["protein"], "protein")} g',
                                              // '${snapshot.hasData ? snapshot.data : this.widget.food["protein"]} g',
                                              style: TextStyle(
                                                fontSize: 20
                                              ),
                                            );
                                          }
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
                                        child: StreamBuilder(
                                          stream: calcBloc.beoStream,
                                          builder: (context, snapshot) {
                                            return Text(
                                              '${_onChangeDataOrNot(snapshot, this.widget.food["beo"], "beo")} g',
                                              // '${snapshot.hasData ? snapshot.data : this.widget.food["beo"]} g',
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            );
                                          }
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
                                        child: StreamBuilder(
                                          stream: calcBloc.carbsStream,
                                          builder: (context, snapshot) {
                                            return Text(
                                              '${_onChangeDataOrNot(snapshot, this.widget.food["carbs"], "carbs")} g',
                                              // '${snapshot.hasData ? snapshot.data : this.widget.food["carbs"]} g',
                                              style: TextStyle(
                                                  fontSize: 20
                                              ),
                                            );
                                          }
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
                      onPressed: this.widget.keyFunctionBtn == "Add" ? _onAddToDiary : _onUpdateToDiary,
                      child: Text(
                          '${this.widget.btnTitle}',
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

  void _onCountChange(String value) {
    calcBloc.CalcTPDinhDuong(widget.food["soluong"]+.0, double.tryParse(value) ?? 0.0, proteinIni, beoIni, carbsIni, caloIni);
    maps["soluong"]=double.tryParse(value) ?? 0.0;
  }

  String _onChangeDataOrNot(AsyncSnapshot<dynamic> snapshot, dynamic value, String key) {
    if (snapshot.hasData) {
      key == "calo" ? maps[key]= int.parse(snapshot.data) : maps[key]= double.parse(snapshot.data);
      return snapshot.data;
    }
    return value.toString();
  }

  void _onAddToDiary() {
    // print(maps.toString());
    listBloc.addListThucAnChosen(maps, () {
      Navigator.pop(context);
    });
  }

  void _onUpdateToDiary() {
    print(maps.toString());

    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => ContainerMain())
    // );
  }

}
