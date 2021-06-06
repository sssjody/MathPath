import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';
import 'edit/person_info_edit.dart';

class PersonInfo extends StatefulWidget{
  UserInfo userInfo;

  PersonInfo({this.userInfo});

  @override
  State<StatefulWidget> createState() => PersonInfoState();

}

class PersonInfoState extends State<PersonInfo>{
  @override
  Widget build(BuildContext context) {
      return Container(
         margin: EdgeInsets.only(left: 20,right: 24,top: 20),
         child: Column(
           children: <Widget>[
             /**
              *  用户资料的标题
              * **/
             Row(
               crossAxisAlignment: CrossAxisAlignment.end,
               mainAxisAlignment : MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text('个人资料',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                 GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Text('编辑资料',style: TextStyle(color: Color(0xff1E90FF),fontSize: 12,fontWeight: FontWeight.w500),),
                        Icon(Icons.arrow_forward_ios_rounded,color: Colors.blueAccent,size: 14,)
                      ],
                    ),
                    onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context){
                                    return PersonInfoEdit(userInfo: widget.userInfo,);
                                }
                            )
                        );
                    },
                 )
               ],
             ),
             SizedBox(height: 10,),
             /**
              *
              * 用户地址
              * **/
             Row(
               children: <Widget>[
                 Icon(Icons.location_on_outlined,color: Color(0xff666666),size: 18),
                 SizedBox(width: 6,),
                 Text(widget.userInfo.location,style: TextStyle(color: Color(0xff666666)))
               ],
             ),
             SizedBox(height: 8,),
             /**
              * 用户的学校 年级 年龄
              *
              * **/
             Row(
                children: <Widget>[
                    Icon(Icons.school_outlined,color: Color(0xff666666),size: 18),
                     SizedBox(width: 6,),
                    Text('${widget.userInfo.edu}  |  ${widget.userInfo.grade}  |  ${widget.userInfo.age}岁',style: TextStyle(color: Color(0xff666666)),)
                ],
             ),
             SizedBox(height: 8,),
             /**
              *
              * 用户的自我介绍
              * **/
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Icon(Icons.text_snippet_outlined,color: Color(0xff666666),size: 18,),
                 SizedBox(width: 6,),
                 Expanded(
                     child: Text(widget.userInfo.intro,style: TextStyle(color: Color(0xff666666)),maxLines: 2,
                     overflow: TextOverflow.ellipsis,softWrap: true,)
                 )
               ],
             ),

             /**
              * 用户的目标对象
              * **/
             Container(
               padding: EdgeInsets.only(top: 4,bottom: 4,left: 12,right: 8),
               margin: EdgeInsets.only(top: 19),
               decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(24)
               ),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                       Row(
                           children: <Widget>[
                             Icon(IconData(0xe6fc,fontFamily: 'MyIcons2'),color: Colors.blueAccent,),
                             SizedBox(width: 6,),
                             Text('目标学校：${widget.userInfo.tagetSchool}',style: TextStyle(fontSize: 13),),
                           ],
                       ),
                       Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 16,)
                   ],
                ),
             )
           ],
         ),
      );
  }

}