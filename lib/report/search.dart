


import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SearchBarState();

}

class SearchBarState extends State<SearchBar>{
  String inputText = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 16,top: 40,bottom: 15),
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
                          suffixIcon: inputText==''?null :
                              GestureDetector(
                                 child: Icon(Icons.cancel,size: 16,color: Colors.grey,),
                                 onTap: (){
                                    if(mounted){
                                        setState(() {
                                            inputText = '';
                                            controller.clear();
                                        });
                                    }
                                 },
                              ),
                          suffixIconConstraints: BoxConstraints(
                              minHeight: 20,
                              minWidth: 33
                          )
                    ),
                       onChanged: (text){
                          if(mounted){
                            setState(() {
                              inputText = text;
                            });
                          }
                       },
                  )
              )
              ),
             SearchIcon()
          ],
      );
  }
}


class SearchIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(top: 26,left: 6,right: 16),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff0B82F1)
          ),
          child: Icon(Icons.search_outlined,color: Colors.white,),
      );
  }
}