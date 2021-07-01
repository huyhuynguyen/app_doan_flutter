import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/add_thucAn_bloc.dart';
import 'package:flutter_app_doan/src/blocs/auth_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';

class ThucDonPage extends StatefulWidget {
  @override
  _ThucDonPageState createState() => _ThucDonPageState();
}

class _ThucDonPageState extends State<ThucDonPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _dvtController = TextEditingController(text: "gam");
  TextEditingController _proteinController = new TextEditingController();
  TextEditingController _beoController = new TextEditingController();
  TextEditingController _carbsController = new TextEditingController();
  TextEditingController _caloController = new TextEditingController();

  AddThucAnBloc addThucAnBloc = new AddThucAnBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addThucAnBloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm thực đơn"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    "Nhập thông tin món ăn",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[800]
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 1,
                    color: Color(0xFFBBBBBB)
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                      blurRadius: 2
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Tên món",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: StreamBuilder(
                                stream: addThucAnBloc.nameStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    controller: _nameController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Số lượng",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: StreamBuilder(
                                stream: addThucAnBloc.numberStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    onChanged: _onNumberChange,
                                    keyboardType: TextInputType.number,
                                    controller: _numberController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText: 100.toString(),
                                      errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Đơn vị tính",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 35, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                readOnly: true,
                                controller: _dvtController,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Protein",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 65, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: StreamBuilder(
                                stream: addThucAnBloc.proteinStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    onChanged: _onProteinChange,
                                    keyboardType: TextInputType.number,
                                    controller: _proteinController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Chất béo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 50, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: StreamBuilder(
                                stream: addThucAnBloc.beoStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    onChanged: _onBeoChange,
                                    keyboardType: TextInputType.number,
                                    controller: _beoController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Carbs",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 80, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: StreamBuilder(
                                stream: addThucAnBloc.carbsStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    onChanged: _onCarbsChange,
                                    keyboardType: TextInputType.number,
                                    controller: _carbsController,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError ? snapshot.error : null
                                    ),
                                  );
                                }
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Calo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB( 90, 0, 0, 0),
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 200),
                              child: TextField(
                                readOnly: true,
                                // keyboardType: TextInputType.number,
                                controller: _caloController,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  hintText: 0.0.toString()
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Thêm thực đơn', style: TextStyle(fontSize: 20.0),),
                minWidth: 350,
                height: 45,
                color: Colors.blueAccent,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                onPressed: _onAddToThucAn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddToThucAn() {
    Map<String, dynamic> thucAnToAdd = {
      "name": _nameController.text.trim(),
      "soluong": double.tryParse(_numberController.text.trim()) ?? 0.0,
      "donvitinh": _dvtController.text.trim(),
      "protein": double.tryParse(_proteinController.text.trim()) ?? -1.0,
      "beo": double.tryParse(_beoController.text.trim()) ?? -1.0,
      "carbs": double.tryParse(_carbsController.text.trim()) ?? -1.0,
      "calo": double.tryParse(_caloController.text.trim()) ?? -1.0
    };

    if (addThucAnBloc.isValidThucAn(thucAnToAdd)) {
      addThucAnBloc.addNewThucAnForUser(thucAnToAdd, () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContainerMain(indexTab: 1,))
        );
      });
    }

  }

  void _onProteinChange(String value) {
    double protein, beo, carbs;
    beo = double.tryParse(_beoController.text.trim()) ?? 0.0;
    carbs = double.tryParse(_carbsController.text.trim()) ?? 0.0;
    protein= double.tryParse(value.trim()) ?? 0.0;
    if (_numberController.text.trim()=="")
      _numberController.text = 100.toString();

    _caloController.text=( (protein*4+carbs*4+beo*9) * (double.tryParse(_numberController.text.trim()) ?? 0.0)/100 ).toString();
  }

  void _onBeoChange(String value) {
    double protein, beo, carbs;
    protein = double.tryParse(_proteinController.text.trim()) ?? 0.0;
    carbs = double.tryParse(_carbsController.text.trim()) ?? 0.0;
    beo= double.tryParse(value.trim()) ?? 0.0;
    if (_numberController.text.trim()=="")
      _numberController.text = 100.toString();

    _caloController.text=( (protein*4+carbs*4+beo*9) * (double.tryParse(_numberController.text.trim()) ?? 0.0)/100 ).toString();
  }

  void _onCarbsChange(String value) {
    double protein, beo, carbs;
    protein = double.tryParse(_proteinController.text.trim()) ?? 0.0;
    beo = double.tryParse(_beoController.text.trim()) ?? 0.0;
    carbs= double.tryParse(value.trim()) ?? 0.0;
    if (_numberController.text.trim()=="")
      _numberController.text = 100.toString();

    _caloController.text=( (protein*4+carbs*4+beo*9) * (double.tryParse(_numberController.text.trim()) ?? 0.0)/100 ).toString();
  }

  void _onNumberChange(String value) {
    if (!(_proteinController.text.trim()==""
        && _beoController.text.trim()==""
        && _carbsController.text.trim()=="")) {
      var protein = double.tryParse(_proteinController.text.trim()) ?? 0.0;
      var beo = double.tryParse(_beoController.text.trim()) ?? 0.0;
      var carbs= double.tryParse(_carbsController.text.trim()) ?? 0.0;
      _caloController.text=((protein*4+carbs*4+beo*9)*(double.tryParse(value) ?? 0.0)/100).toString();
    }
  }
}