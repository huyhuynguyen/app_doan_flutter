import 'package:flutter/cupertino.dart';
import 'package:flutter_app_doan/src/fire_base/fire_base_auth.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';

class ItemCheckedBloc {
  FirAuth _firAuth = new FirAuth();

  // hiển thị tên show lên Dialog khi chọn tick trong dinhDuongPage
  List<Widget> listThucAnDaChon() {
    return GlobalList.thucAnDaChon.map((element) => Text(
          '${element["name"]}'
      )
    ).toList();
  }

  // thêm khi nhấn tick trong dinhDuongPage
  void addlistThucAnDaChon(Function onSuccess) {
    GlobalList.thucAnDaChon.forEach((element) {
      _firAuth.addThucAnChosen(element, onSuccess);
    });
  }

  // hiển thị tên show lên Dialog khi chọn tick trong exercisePage
  List<Widget> listExerciseDaChon() {
    return GlobalList.tapLuyenDaChon.map((element) => Text(
        '${element["name"]}'
      )
    ).toList();
  }

  // thêm khi nhấn tick trong exercisePage
  void addlistTapLuyenDaChon(Function onSuccess) {
    GlobalList.tapLuyenDaChon.forEach((element) {
      _firAuth.addTapLuyenChosen(element, onSuccess);
    });
  }
}