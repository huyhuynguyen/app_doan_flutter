import 'package:flutter/material.dart';
import 'package:flutter_app_doan/src/resources/selectedTick/global_list.dart';

class SelectedTick extends StatefulWidget {
  final Map<String, dynamic> item;
  final String keyWord;

  SelectedTick({this.item, this.keyWord});
  @override
  _SelectedTickState createState() => _SelectedTickState();
}

class _SelectedTickState extends State<SelectedTick> with AutomaticKeepAliveClientMixin{
  bool _isChecked=false;

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Positioned(
        right: 12,
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: _isChecked ? Colors.blue[400] : Colors.white,
              border: Border.all(
                  color: Color(0xFF959595)
              ),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: IconButton(
              iconSize: 18,
              color: _isChecked ? Colors.white : Colors.black,
              icon: Icon(Icons.check),
              onPressed: _onCheckItem
          ),
        )
    );
  }

  void _onCheckItem() {
    setState(() {
      _isChecked=!_isChecked;
      // khi chọn
      if (_isChecked) {
        widget.keyWord=="ThucAn" ? GlobalList.thucAnDaChon.add(widget.item) : GlobalList.tapLuyenDaChon.add(widget.item);
        // if (widget.keyWord=="ThucAn") {
        //   GlobalList.thucAnDaChon.add(widget.item);
        // }
        // else {
        //   GlobalList.tapLuyenDaChon.add(widget.item);
        // }
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text('${widget.item["name"]} is selected')
            )
        );
      }
      // khi bỏ chọn
      else {
        widget.keyWord=="ThucAn" ? GlobalList.thucAnDaChon.remove(widget.item) : GlobalList.tapLuyenDaChon.remove(widget.item);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 1),
                content: Text('${widget.item["name"]} is removed')
            )
        );
      }
    });
  }
}
