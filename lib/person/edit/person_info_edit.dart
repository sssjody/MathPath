

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/person/edit/edit_age.dart';
import 'package:study/person/edit/edit_gender.dart';
import 'package:study/person/edit/edit_grade.dart';
import 'package:study/person/edit/edit_location.dart';
import 'package:study/person/model/model.dart';

import 'edit_avatar.dart';
import 'edit_nickname.dart';

class PersonInfoEdit extends StatelessWidget{
  UserInfo userInfo;

  PersonInfoEdit({
     this.userInfo
  });

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                EditHead(),
                EditAvatar(userInfo),
                EditNickName(userInfo),
                EditGender(userInfo),
                EditAge(userInfo),
                EditGrade(userInfo),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 9,
                    color: Color(0xffececec),
                ),
                EditLocation(userInfo)

              ],
            ),
          )
      );
  }
}

class EditHead extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Container(
         margin: EdgeInsets.only(left: 16,right: 16),
         padding: EdgeInsets.only(top: 38,),
         child: Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
                 Icon(Icons.arrow_back_ios,size: 18,),
                 Text('编辑个人信息',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                 Text('保存',style: TextStyle(color: Color(0xff0B82F1),fontWeight: FontWeight.w500),)
             ],
         ),
     );
  }

}








