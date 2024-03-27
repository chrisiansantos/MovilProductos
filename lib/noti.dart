import 'package:flutter/cupertino.dart';

class FavNoti extends ChangeNotifier{
  void refrescar(){
    notifyListeners();
  }
}