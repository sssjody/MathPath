


import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:study/person/model/model.dart';

class EditAge extends StatefulWidget{
  UserInfo userInfo;

  EditAge(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditAgeState();

}

class EditAgeState extends State<EditAge>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 10),
      padding: EdgeInsets.only(top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('年龄'),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text('${widget.userInfo.age}岁'),
                SizedBox(width: 3,),
                Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
              ],
            ),
            onTap: (){
                DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime(2000,1,1),
                    maxTime: DateTime.now(),
                    currentTime: DateTime.now(),
                    locale: LocaleType.zh,
                    onConfirm: (date){
                        setState(() {
                            widget.userInfo.age = calculateAge(date);
                        });
                    },
                );
            },
          )
        ],
      ),
    );
  }

  int calculateAge(DateTime brt){
    DateTime dateTime = DateTime.now();
    int yearNow = dateTime.year;  //当前年份
    int monthNow = dateTime.month;  //当前月份
    int dayOfMonthNow = dateTime.day; //当前日期

    int yearBirth = brt.year;
    int monthBirth = brt.month;
    int dayOfMonthBirth = brt.day;
    int age = yearNow - yearBirth;   //计算整岁数
    if (monthNow <= monthBirth) {
      if (monthNow == monthBirth) {
        if (dayOfMonthNow < dayOfMonthBirth) age--;//当前日期在生日之前，年龄减一
      } else {
        age--;//当前月份在生日之前，年龄减一
      }
    }
    return age;
  }
}