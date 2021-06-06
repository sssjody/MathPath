


import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';

class PersonTags extends StatefulWidget{
  UserInfo userInfol;

  PersonTags(this.userInfol);

  @override
  State<StatefulWidget> createState() => PersonTagsState();
}

class PersonTagsState extends State<PersonTags>{
  @override
  Widget build(BuildContext context) {
      return Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
           ),
           width: MediaQuery.of(context).size.width - 44,
           margin: EdgeInsets.only(left: 20,right: 24,top: 10),
         //  padding: EdgeInsets.symmetric(vertical: 12),
           child: Column(
              children: <Widget>[
               // Text('擅长标签',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                Container(
                    child: Wrap(
                        spacing: 6,
                        runSpacing: 8,
                        children: generateTags()
                    ),
                )
              ],
           ),
      );
  }


  List<Widget> generateTags(){
     List<Widget> newList = [];
      widget.userInfol.tags.forEach((element) {
          newList.add(
             TagItem(element)
          );
      });
      return newList;
  }

}

class TagItem extends StatelessWidget{
  String _tagName;

  TagItem(this._tagName);

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
        decoration: BoxDecoration(
            color: Color(0xffECF5FE),
            borderRadius: BorderRadius.circular(10)
        ),
          child: Text(_tagName,style: TextStyle(color: Color(0xff0B82F1)),),
      );
  }
  
}