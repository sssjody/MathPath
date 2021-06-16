
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/person/model/model.dart';



//修改昵称
class EditNickName extends StatefulWidget{
  UserInfo userInfo;

  EditNickName(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditNickNameState();
}

class EditNickNameState extends State<EditNickName>{
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    String nickName = widget.userInfo.nickName;
    controller = TextEditingController(text: nickName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('昵称',),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text(widget.userInfo.nickName),
                SizedBox(width: 4,),
                Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
              ],),
            onTap: editNickName,
          )
        ],
      ),
    );
  }


  void editNickName(){
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)
            )
        ),
        isScrollControlled: true,
        builder: (context){
          return Container(
              height: MediaQuery.of(context).size.height - 150 - MediaQuery.of(context).viewInsets.bottom,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 14,),
                  Stack(
                    children: <Widget>[
                      Align(
                        child: Text('修改昵称',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                        alignment: Alignment.center,
                      ),
                      GestureDetector(
                        child: Align(
                          child: Padding(
                            child: Icon(Icons.close_rounded),
                            padding: EdgeInsets.only(right: 8),
                          ),
                          alignment: Alignment.topRight,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16,right: 16),
                    child: TextField(
                        controller:  controller,
                        textAlignVertical: TextAlignVertical.center,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        )
                    ),
                  ),
                  Divider(
                    height: 0.5,
                    indent: 16,
                    endIndent: 16,
                  ),
                  SizedBox(height: 24,),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.only(left: 16,right: 16),
                      width: MediaQuery.of(context).size.width - 32,
                      child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 16),),
                      decoration: BoxDecoration(
                          color: Color(0xff0B82F1),
                          borderRadius: BorderRadius.circular(24)
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        widget.userInfo.nickName = controller.value.text;
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              )
          );
        }
    );
  }

}