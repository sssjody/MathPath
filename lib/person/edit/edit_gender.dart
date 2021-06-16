


import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';

class EditGender extends StatefulWidget{
  UserInfo userInfo;

  EditGender(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditGenderState();

}

class EditGenderState extends State<EditGender>{
  @override
  Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.only(left: 16,right: 10),
         padding: EdgeInsets.only(top: 22),
         child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
                 Text('性别'),
                 GestureDetector(
                     child: Row(
                       children: <Widget>[
                         Text(widget.userInfo.sex ? '男' : '女'),
                         SizedBox(width: 3,),
                         Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
                       ],
                     ),
                     onTap: (){
                         editGender();
                     },
                 )
             ],
         ),
     );
  }

  void editGender(){
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12)
              )
          ),
          enableDrag: false,
          context: context,
          builder: (context){
              return Container(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Padding(
                            child: Text('我是男生',style: TextStyle(fontSize: 16),),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onTap: (){
                            setState(() {
                              widget.userInfo.sex = true;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                          Divider(height: 0.5,indent: 12,endIndent: 12,),
                        GestureDetector(
                          child: Padding(
                            child: Text('我是女生',style: TextStyle(fontSize: 16),),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onTap: (){
                            setState(() {
                              widget.userInfo.sex = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                          Container(
                             width: MediaQuery.of(context).size.width,
                             height: 5,
                             color: Color(0xffececec),
                          ),
                          GestureDetector(
                              child: Padding(
                                  child: Text('取消',style: TextStyle(fontSize: 16),),
                                  padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                              onTap: (){
                                 Navigator.of(context).pop();
                              },
                          )
                      ],
                  ),
              );
          }
      );
  }
}