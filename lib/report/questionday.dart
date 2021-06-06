

import 'package:flutter/material.dart';

class QuestionDay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QuestionDayState();

}

class QuestionDayState extends State<QuestionDay>{
  @override
  Widget build(BuildContext context) {
     return Stack(
        children: <Widget>[
            Container(
               alignment: Alignment.topLeft,
               decoration: BoxDecoration(
                  color: Color(0xffececec),
                  borderRadius: BorderRadius.circular(8)
               ),
               margin: EdgeInsets.only(left: 16,right: 16,top: 20),
               padding: EdgeInsets.only(left: 68,right: 8,bottom: 10,top: 10),
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text('每日一题',style: TextStyle(color: Colors.grey,fontSize: 12),),
                      SizedBox(height: 10,),
                      Text(
                        '1707.与数组中元素的最大异或值',
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(fontWeight: FontWeight.bold),
                      )
                  ],
               ),
            ),
          Container(
            margin: EdgeInsets.only(left: 28,top: 14),
            padding: EdgeInsets.only(left: 8,right: 8,top: 10,bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffECF5FE),Colors.white]
              ),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [BoxShadow(
                 color: Colors.black12,
                  offset: Offset(-5.0, 5.0), //阴影xy轴偏移量
                  blurRadius: 6.0, //阴影模糊程度
                  spreadRadius: 0.1
              )]
            ),
            child: Column(
              children: <Widget>[
                Text('MAY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.red),),
                SizedBox(height: 4,),
                Text('23',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),)
              ],
            ),
          ),
        ],
     );
  }
}