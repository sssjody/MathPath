

import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';

class PersonHead extends StatefulWidget{
  bool hasFollowed;
  bool isMe;
  UserInfo userInfo;
  PersonHead({this.hasFollowed = false,this.isMe = true,this.userInfo});

  @override
  State<StatefulWidget> createState() => PersonHeadState();
}

class PersonHeadState extends State<PersonHead>{
  @override
  Widget build(BuildContext context) {
     return Container(
        padding: EdgeInsets.only(right: 24,left: 20,top: 50),
        decoration: BoxDecoration(
          color: Color(0xfff1f1f1)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
               children: <Widget>[
                 /**
                  * 用户头像
                  * **/
                 Container(
                     width: 80,
                     height: 80,
                     alignment: Alignment.center,
                     child: ClipOval(
                       child : Image.network(widget.userInfo.avatarUrl),
                     )
                 ),
                 SizedBox(width: 15,),
                 /**
                  * 用户的昵称
                  * **/
                 Text('${widget.userInfo.nickName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
               ],
            ),


            /**
             * 是否关注该用户
             * **/
            GestureDetector(
              child: widget.hasFollowed || widget.isMe ?
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      alignment: Alignment.center,
                      child: Icon(IconData(0xe681,fontFamily: 'MyIcons2',),color: Colors.white,size: 22,)
                  )
               : Container(
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.only(left: 2,bottom: 2),
                  decoration: BoxDecoration(
                      color: Color(0xffe5e5e5),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  child: Icon(IconData(0xe677,fontFamily: 'MyIcons2',),color: Colors.blueAccent,size: 22,)
              ),
              onTap: (){
                  setState(() {
                    if(!widget.isMe)  widget.hasFollowed = !widget.hasFollowed;
                  });
              },
            )
          ],
        ),
     );
  }
}