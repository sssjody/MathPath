

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';

class PersonPractice extends StatefulWidget{
  UserInfo userInfo ;

  PersonPractice({this.userInfo});

  @override
  State<StatefulWidget> createState() => PersonPracticeState();
}

class PersonPracticeState extends State<PersonPractice>{
  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(left: 12,top: 16,bottom: 22),
          margin: EdgeInsets.only(left: 20,top: 14,right: 24),
          width: MediaQuery.of(context).size.width - 44,
          decoration: BoxDecoration(
              color: Color(0xfff3f3f3),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                child: Sparkline(
                  useCubicSmoothing: true,
                  lineWidth: 3,
                  lineColor: Color(0xff0B82F1),
                  data: widget.userInfo.data,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                     colors: [Color(0xffECF5FE),Color(0xffECF5FE)],
                  ),
                ),
              ),),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('本月'),
                    Text('37',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text('共练习'),
                    Text('377',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
              )
            ],
          ),
      );
  }
}