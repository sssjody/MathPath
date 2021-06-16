


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
  String input = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(top: 40,left: 6,right: 16),
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                   Icon(Icons.arrow_back_ios_outlined,size: 18,),
                   SizedBox(width: 6,),
                   Expanded(
                       child: Container(
                         child: TextField(
                           controller: controller,
                           textAlignVertical: TextAlignVertical.center,
                           style: TextStyle(fontSize: 14),
                           cursorWidth: 1.5,
                           cursorHeight: 18,
                           maxLines: 1,
                           minLines: 1,
                           decoration: InputDecoration(
                               hintText: '请输入搜索内容',
                               hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                               filled: true,
                               fillColor: Color(0xffececec),
                               contentPadding: EdgeInsets.only(left: 14,top: 7,bottom: 7,),
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
                               suffixIcon: input == '' ? null
                                   : GestureDetector(
                                    child: Icon(Icons.cancel,size: 16,color: Colors.grey,),
                                     onTap: (){
                                         if(mounted){
                                            setState(() {
                                              input = '';
                                              controller.clear();
                                            });
                                         }
                                     },
                               )
                           ),
                           onChanged: (String value){
                              setState(() {
                                input = value;
                              });
                           },
                         ),
                       ),
                   ),
                   SizedBox(width: 8,),
                   Text('搜索',style: TextStyle(color: Colors.blueAccent),)
               ],
           ),
      );
  }
}