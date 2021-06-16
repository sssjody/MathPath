


import 'package:flutter/material.dart';

class SearchSchool extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: PreferredSize(
              child: SearchBar(),
              preferredSize: Size.fromHeight(50),
          ),
      );
  }
}



class SearchBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return SearchBarState();
  }
}
class SearchBarState extends State<SearchBar>{
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
           child: Row(
               children: <Widget>[
                   Icon(Icons.arrow_back_ios_rounded),
                   Expanded(
                       child: Container(
                         child: TextField(
                           controller: controller,
                           textAlignVertical: TextAlignVertical.center,
                           style: TextStyle(fontSize: 16),
                           cursorWidth: 1,
                           decoration: InputDecoration(
                               hintText: '请输入搜索内容',
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                               filled: true,
                               fillColor: Color(0xffececec),
                               contentPadding: EdgeInsets.only(left: 14,top: 8,bottom: 8,),
                               enabledBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: BorderSide(
                                       color: Color(0xffececec)
                                   )
                               ),
                               focusedBorder: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: BorderSide(
                                       color: Color(0xffececec)
                                   )
                               ),
                               isCollapsed : true,
                               isDense : true,
                           ),
                         ),
                       ),
                   ),
                   Text('搜索',style: TextStyle(color: Colors.blueAccent),)
               ],
           ),
      );
  }
}