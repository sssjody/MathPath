

import 'package:flutter/material.dart';
import 'package:study/home/home.dart';
import 'package:study/person/model/model.dart';

class EditGrade extends StatefulWidget{
  UserInfo userInfo;


  EditGrade(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditGradeState();
}

class EditGradeState extends State<EditGrade>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 10),
      padding: EdgeInsets.only(top: 22,bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('初中年级'),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text('${widget.userInfo.grade}'),
                SizedBox(width: 3,),
                Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
              ],
            ),
            onTap: showBottom,
          )
        ],
      ),
    );
  }


  void showBottom() async{
    String str =  await showModalBottomSheet(
        enableDrag: false,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
        ),
        builder: (context){
          return Container(
            padding: EdgeInsets.only(bottom: 20),
            height: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('选择年级',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GradeContainer(grade: '七年级上',currentGrade: widget.userInfo.grade,),
                    GradeContainer(grade: '八年级上',currentGrade: widget.userInfo.grade,),
                    GradeContainer(grade: '九年级上',currentGrade: widget.userInfo.grade,)
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GradeContainer(grade: '七年级下',currentGrade: widget.userInfo.grade,),
                    GradeContainer(grade: '八年级下',currentGrade: widget.userInfo.grade,),
                    GradeContainer(grade: '九年级下',currentGrade: widget.userInfo.grade,)
                  ],
                )
              ],
            ),
          );
        }
    );
    setState(() {
      if(str != null && str.isNotEmpty){
        widget.userInfo.grade = str;
      }
    });
  }
}