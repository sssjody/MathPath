



import 'package:flutter/material.dart';
import 'package:study/person/edit/page/seach_school.dart';
import 'package:study/person/model/model.dart';

class EditSchool extends StatefulWidget{
  UserInfo userInfo;

  EditSchool(this.userInfo);

  @override
  State<StatefulWidget> createState() {
      return EditSchoolState();
  }
}

class EditSchoolState extends State<EditSchool>{
  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(left: 16,right: 10),
          padding: EdgeInsets.only(top: 22),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Text('学校'),
                  GestureDetector(
                      child: Row(
                          children: <Widget>[
                             Text('${widget.userInfo.edu}'),
                            SizedBox(width: 3,),
                            Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
                          ],
                      ),
                      onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                  return SearchSchool();
                              })
                          );
                      },
                  )
              ],
          ),
      );
  }

}