import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/blocs/ghi_chu_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/ghi_chu_page.dart';
import 'package:intl/intl.dart';

class ThemEditGhiChu extends StatefulWidget {
  Map<String, dynamic> note;
  String title;
  String keyAction;
  ThemEditGhiChu({this.note, this.keyAction ,this.title});

  @override
  _ThemEditGhiChuState createState() => _ThemEditGhiChuState();
}

class _ThemEditGhiChuState extends State<ThemEditGhiChu> {
  // TextEditingController get _tieudeController => (this.widget.keyAction=="edit") ? TextEditingController(text: this.widget.note["tieude"]) : TextEditingController(text: "");
  // TextEditingController get _noidungController => (this.widget.keyAction=="edit") ? TextEditingController(text: this.widget.note["noidung"]) : TextEditingController(text: "");
  TextEditingController _tieudeController;
  TextEditingController _noidungController;
  CalcBloc calcBloc = new CalcBloc();
  GhiChuBloc ghiChuBloc = new GhiChuBloc();
  String timeNote="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tieudeController = new TextEditingController();
    _noidungController = new TextEditingController();
    if (this.widget.keyAction=="edit") {
      _tieudeController.text=this.widget.note["tieude"];
      _noidungController.text=this.widget.note["noidung"];
    }
    timeNote = this.widget.keyAction=="edit" ? this.widget.note["thoigian"] : DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    calcBloc.dispose();
    ghiChuBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.widget.title} ghi chú'),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: this.widget.keyAction == "add" ? _onAddToNote : _onEditToNote
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Color(0xFFBBBBBB)
                  ),
                  borderRadius: BorderRadius.circular(5),
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
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Align(
                          child: Text(
                              "Tên tiêu đề",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: StreamBuilder(
                        stream: ghiChuBloc.tieudeStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _tieudeController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(15),
                              errorText: snapshot.hasError ? snapshot.error : null
                            ),
                          );
                        }
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Color(0xFFBBBBBB)
                  ),
                  borderRadius: BorderRadius.circular(5),
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
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Align(
                        child: Text(
                          "Thời gian",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 10),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.calendar_today_rounded),
                              onPressed: (){
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.parse(timeNote),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(DateTime.now().year+1)
                                ).then((value) {
                                  calcBloc.getDayCalendar(value);
                                });
                              }
                          ),
                          Container(
                            child: StreamBuilder(
                              stream: calcBloc.dateStream,
                              builder: (context, snapshot) {
                                return Text(
                                  '${_onDateChangeOrNot(snapshot)}',
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                );
                              }
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Color(0xFFBBBBBB)
                  ),
                  borderRadius: BorderRadius.circular(5),
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
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Align(
                        child: Text(
                          "Nội dung",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: StreamBuilder(
                        stream: ghiChuBloc.noidungStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _noidungController,
                            minLines: 12, // any number you need (It works as the rows for the textarea)
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(15),
                              errorText: snapshot.hasError ? snapshot.error : null
                            ),
                          );
                        }
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onDateChangeOrNot(AsyncSnapshot<Object> snapshot) {
    if (snapshot.hasData)
      timeNote = snapshot.data;
    return timeNote;
  }

  void _onAddToNote() {
    Map<String, String> note= {
      "tieude": _tieudeController.text.trim(),
      "thoigian": timeNote,
      "noidung": _noidungController.text.trim()
    };
    if (ghiChuBloc.checkNullValue(note["tieude"], note["noidung"])) {
      ghiChuBloc.addToNote(note, (){
        _tieudeController.text="";
        _noidungController.text="";
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Đã thêm ghi chú"))
        );
      });
    }
  }

  void _onEditToNote() {
    Map<String, String> noteNew= {
      "tieude": _tieudeController.text.trim(),
      "thoigian": timeNote,
      "noidung": _noidungController.text.trim(),
      "user": this.widget.note["user"],
    };

    if (ghiChuBloc.checkNullValue(noteNew["tieude"], noteNew["noidung"])) {
      ghiChuBloc.updateNote(noteNew, this.widget.note["docID"], (){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Đã sửa ghi chú"))
        );
      });
    }
  }
}
