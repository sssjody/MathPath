

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';


//修改头像
class EditAvatar extends StatefulWidget{
  UserInfo userInfo;

  EditAvatar(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditAvatarState();
}
class EditAvatarState extends State<EditAvatar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 10),
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('头像',),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 4),
                width: 60,
                height: 60,
                child: ClipOval(
                  child: Image.network(widget.userInfo.avatarUrl,fit:BoxFit.cover,),
                ),
              ),
              SizedBox(width: 3,),
              Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
            ],
          )
        ],
      ),
    );
  }
}