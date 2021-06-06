

import 'package:flutter/cupertino.dart';

class DropDownController extends ChangeNotifier{
   //当前是否有列表打开
   bool isShow = false;
   //当前打开当列表的下标 -1 没有
   int index = -1;

   bool hideOthers = false;

   void show(int index){
     hideOthers = false;
       this.isShow = true;
       this.index = index;
       notifyListeners();
   }

   void hide(){
     hideOthers = false;
       this.index = -1;
       this.isShow = false;
       notifyListeners();
   }

   void hideOther(){
      hideOthers = true;
      notifyListeners();
   }
}