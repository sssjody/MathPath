

import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';

class PersonTitle extends StatelessWidget{
  UserInfo userInfo;


  PersonTitle(this.userInfo);

  @override
  Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(top: 23,left: 30,right: 24,bottom: 18),
        color: Color(0xfff1f1f1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('${userInfo.following}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                Text('关注',)
              ],
            ),
            Column(
              children: <Widget>[
                Text('${userInfo.follower}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text('粉丝')
              ],
            ),
            Column(
              children: <Widget>[
                Text('${userInfo.rank}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text('全站排名')
              ],
            ),
            Column(
              children: <Widget>[
                Text('${userInfo.questionNum}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                SizedBox(height: 3,),
                Text('刷题数')
              ],
            )
          ],
        ),
     );
  }

}