


import 'package:flutter/material.dart';

class StudyTool extends StatefulWidget{
  final List urlList = [
      ['https://sssjody.oss-cn-beijing.aliyuncs.com/study/Questions-Easy.jpeg','公式大全'],
      ['https://sssjody.oss-cn-beijing.aliyuncs.com/study/Question-Medium.jpeg','错题本'],
      ['https://sssjody.oss-cn-beijing.aliyuncs.com/study/Question-Hard.jpeg','笔记本'],
      ['https://sssjody.oss-cn-beijing.aliyuncs.com/study/p5.jpeg','我的收藏']
  ];
  @override
  State<StatefulWidget> createState() => StudyToolState();
}

class StudyToolState extends State<StudyTool>{
  @override
  Widget build(BuildContext context) {
      return Container(
         margin: EdgeInsets.only(left: 16,right: 16,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                          child: Image.network(widget.urlList[0][0],width: 75,height: 100,),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      SizedBox(height: 4,),
                      Text(widget.urlList[0][1],style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                       child: Image.network(widget.urlList[1][0],width: 75,height: 100,),
                       borderRadius: BorderRadius.circular(12),
                    ),
                    SizedBox(height: 4,),
                    Text(widget.urlList[1][1],style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(widget.urlList[2][0],width: 75,height: 100,),
                       borderRadius: BorderRadius.circular(12),
                    ),
                    SizedBox(height: 4,),
                    Text(widget.urlList[2][1],style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(widget.urlList[3][0],width: 75,height: 100,),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    SizedBox(height: 4,),
                    Text(widget.urlList[3][1],style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
      );
  }
}
