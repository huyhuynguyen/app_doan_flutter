import 'dart:async';

class CalcBloc {
  StreamController _bmiController=new StreamController();
  StreamController _brmController=new StreamController();
  StreamController _tdeeController=new StreamController();



  void dispose() {
    _bmiController.close();
    _brmController.close();
    _tdeeController.close();
  }
}