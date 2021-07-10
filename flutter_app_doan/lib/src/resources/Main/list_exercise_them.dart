import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/blocs/calc_bloc.dart';
import 'package:flutter_app_doan/src/blocs/calc_calo_time_bloc.dart';
import 'package:flutter_app_doan/src/blocs/list_bloc.dart';
import 'package:flutter_app_doan/src/resources/Main/container_main.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/selected_tick.dart';

class ListExerciseThem extends StatefulWidget {
  String searchText;
  ListExerciseThem({this.searchText});

  @override
  _ListExerciseThemState createState() => _ListExerciseThemState();
}

class _ListExerciseThemState extends State<ListExerciseThem> {
  ListBloc listBloc = new ListBloc();
  CalcCaloTimeBloc calcCaloTimeBloc;
  int timeIni;
  double caloIni;
  String timeCurrent="";

  createDialogToAdd(Map<String, dynamic> exercise) {
    DateTime timeChanged=DateTime.utc(DateTime.parse(GlobalList.time).year, DateTime.parse(GlobalList.time).month, DateTime.parse(GlobalList.time).day);
    DateTime timeNow=DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    calcCaloTimeBloc = new CalcCaloTimeBloc();
    TextEditingController _timeController = new TextEditingController();
    timeIni=exercise["time"];
    caloIni=exercise["calo"]+.0;
    print('Time ${GlobalList.time}');
    timeCurrent=GlobalList.time;
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
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: (){
                            listBloc.deleteTapLuyenTuChon(exercise["id"], (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => ContainerMain(indexTab: 2,))
                              );
                            });
                          },
                          child: Text(
                            "Xoá tự chọn"
                          )
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.of(context).pop(true);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: (){
                              if (timeChanged.compareTo(timeNow)>=0) {
                                if (calcCaloTimeBloc.checkTimeChange(int.tryParse(_timeController.text) ?? 0)) {
                                  exercise["time"]=int.parse(_timeController.text.trim());
                                  exercise["calo"]=double.parse(double.parse(exercise["calo"]).toStringAsFixed(0));
                                  listBloc.addTapluyenChosen(exercise, (){
                                    Navigator.pop(context);
                                  });
                                }
                              }
                              else {
                                ScaffoldMessenger.of(this.context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Text('Can not add Exercise at previous days!!')
                                    )
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Add"),
                          ),
                        ],
                      )
                    ],
                  ),
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
      future: listBloc.getListExerciseThem(this.widget.searchText),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            // nếu nhập có dữ liệu hoặc chưa nhập gì
              child: (snapshot.data.length>0 || this.widget.searchText.trim()=="") ? ListView.builder(
                // nếu chưa nhập sẽ hiển thị full tapluyen
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, item) {
                    Map<String, dynamic> exercise = snapshot.data[item];
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            createDialogToAdd(exercise);
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
                                            '${exercise["calo"]} calo',
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
                        SelectedTick(item: exercise, keyWord: "TapLuyen",),
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
    GlobalList.time=timeCurrent;
    calcCaloTimeBloc.calcCaloFromTapLuyen(timeIni, int.tryParse(value) ?? 0, caloIni);
  }

  // method riêng để get dữ liệu snapshot khi change calo
  String _onChangeCaloOrNot(AsyncSnapshot<dynamic> snapshot, Map<String, dynamic> exercise) {
    if (snapshot.hasData)
      exercise["calo"]=snapshot.data;
    return exercise["calo"].toString();
  }
}
