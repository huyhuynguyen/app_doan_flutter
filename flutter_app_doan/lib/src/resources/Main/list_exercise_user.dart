import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/calc_calo_time_bloc.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';
import 'package:flutter_app_doan/src/resources/dialog/loading_dialog.dart';


class ListExerciseUser extends StatefulWidget {
  @override
  _ListExerciseUserState createState() => _ListExerciseUserState();
}

class _ListExerciseUserState extends State<ListExerciseUser> {
  final ListBloc listBloc = new ListBloc();
  CalcCaloTimeBloc calcCaloTimeBloc;
  int timeIni;
  double caloIni;

  createDialogToUpdate(Map<String, dynamic> exercise) {
    calcCaloTimeBloc = new CalcCaloTimeBloc();
    TextEditingController _timeController = new TextEditingController();
    timeIni=exercise["time"];
    // print(exercise["calo"].runtimeType);
    caloIni=exercise["calo"]+.0;
    showDialog(context: context,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${exercise["name"]}',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            child: StreamBuilder(
                                stream: calcCaloTimeBloc.timeStream,
                                builder: (context, snapshot) {
                                  return TextField(
                                    controller: _timeController,
                                    keyboardType: TextInputType.number,
                                    onChanged: _onTimeChange,
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError ? snapshot.error : null,
                                        hintText: '${exercise["time"]}'
                                    ),
                                  );
                                }
                            ),
                          ),
                          Text(
                            " phút",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          StreamBuilder(
                              stream: calcCaloTimeBloc.caloTimeStream,
                              builder: (context, snapshot) {
                                return Text(
                                  '${_onChangeCaloOrNot(snapshot, exercise)} ',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                );
                              }
                          ),
                          Text(
                            "calo",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: (){
                        if (calcCaloTimeBloc.checkTimeChange(int.tryParse(_timeController.text) ?? 0)) {
                          exercise["time"]=int.parse(_timeController.text.trim());
                          exercise["calo"]=double.parse(double.parse(exercise["calo"]).toStringAsFixed(0));
                          listBloc.updateTapLuyenUser(exercise, (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ContainerMain())
                            );
                          });
                        }
                      },
                      child: Text("Update"),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    ).then((exit) {
      if (exit==null || exit) {
        calcCaloTimeBloc.dispose();
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listBloc.getListTapLuyenForUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
              child: (snapshot.data.length>0) ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: snapshot.data.length,
                  itemBuilder: (context, item) {
                    Map<String, dynamic> exercise=snapshot.data[item];
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            createDialogToUpdate(exercise);
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
                                        exercise["name"],
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
                                      '${exercise["time"]} phút',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            '${exercise["calo"].toStringAsFixed(0)} calo',
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
                        Positioned(
                            right: 12,
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
                                    LoadingDialog.showLoadingDialog(context, "Loading...");
                                    listBloc.deleteTapluyenUser(exercise["docID"], () {
                                      LoadingDialog.hideLoadingDialog(context);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ContainerMain())
                                      );
                                    });
                                  },
                                )
                            )
                        )
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

  void _onTimeChange(String value) {
    calcCaloTimeBloc.calcCaloFromTapLuyen(timeIni, int.tryParse(value) ?? 0, caloIni);
  }

  String _onChangeCaloOrNot(AsyncSnapshot<dynamic> snapshot, Map<String, dynamic> exercise) {
    if (snapshot.hasData)
      exercise["calo"]=snapshot.data;
    return exercise["calo"].toString();
  }
}
