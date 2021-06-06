

import 'package:flutter/material.dart';
import 'package:study/person/PersonTitle.dart';
import 'package:study/person/Person_info.dart';
import 'package:study/person/model/model.dart';
import 'package:study/person/person_head.dart';
import 'package:study/person/person_practice.dart';
import 'package:study/person/person_tags.dart';

class PersonPage extends StatefulWidget{
  UserInfo userInfo = UserInfo();

  @override
  State<StatefulWidget> createState() => PersonPageState();
}


class PersonPageState extends State<PersonPage>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PersonHead(userInfo: widget.userInfo,),
              PersonTitle(widget.userInfo),
              PersonInfo(userInfo: widget.userInfo,),
              SizedBox(height: 14,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('擅长标签',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              ),
              PersonTags(widget.userInfo),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('做题记录',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              ),
              PersonPractice(userInfo: widget.userInfo,),
              SizedBox(height: 30,)
            ],
          ),
        ),
      );
  }
}