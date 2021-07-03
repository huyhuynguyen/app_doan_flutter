import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/ghi_chu_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/ghi_chu_page.dart';
import 'package:flutter_app_doan/src/resources/Main/them_edit_ghi_chu.dart';
import 'package:flutter_app_doan/src/resources/dialog/loading_dialog.dart';

class ListGhiChu extends StatelessWidget {
  GhiChuBloc ghiChuBloc = new GhiChuBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ghiChuBloc.getAllNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) {
                  Map<String, dynamic> note = snapshot.data[item];
                  bool isEndGreaterThan30 = note["noidung"].length > 30;
                  String noidungShow=note["noidung"].substring(0, isEndGreaterThan30 ? 30 : note["noidung"].length);
                  noidungShow+= isEndGreaterThan30 ? "..." : "";
                  return Stack(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ThemEditGhiChu(note: note,title: "Sửa", keyAction: "edit",))
                          );
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
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1,
                                  color: Color(0xFFBBBBBB)
                              )
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Container(
                                    child: Align(
                                      child: Text(
                                        note["tieude"],
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        noidungShow,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                        color: Colors.grey
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        note["thoigian"],
                                        style: TextStyle(
                                            fontSize: 16,
                                          color: Colors.grey
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 15,
                          right: 22,
                          child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  border: Border.all(
                                      color: Color(0xFF959595)
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: IconButton(
                                iconSize: 18,
                                color: Colors.white,
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  // print(note);
                                  LoadingDialog.showLoadingDialog(context, "Loading...");
                                  ghiChuBloc.deleteNote(note["docID"], () {
                                    LoadingDialog.hideLoadingDialog(context);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) =>GhiChuPage())
                                    );
                                  });
                                },
                              )
                          )
                      )
                    ],
                  );
                }
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
