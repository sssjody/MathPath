import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:study/person/model/model.dart';

class EditLocation extends StatefulWidget{
  UserInfo userInfo;

  EditLocation(this.userInfo);

  @override
  State<StatefulWidget> createState() => EditLocationState();
}

class EditLocationState extends State<EditLocation>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16),
      padding: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('所在城市'),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text('${widget.userInfo.location}'),
                Icon(Icons.arrow_forward_ios_rounded,size: 16,color : Colors.grey)
              ],
            ),
            onTap: (){
                 showLocation();
            },
          )
        ],
      ),
    );
  }

  void showLocation(){
      Pickers.showAddressPicker(
          context,
          initProvince: '上海市',
          initCity: '上海市',
          initTown: '浦东新区',
          onConfirm: (province,city,town){
              setState(() {
                  widget.userInfo.location = '$province';
                  if(province != city && city != '市辖区'){
                    widget.userInfo.location += '-$city';
                  }
                  if(city!=town && town != '市辖区'){
                    widget.userInfo.location += '-$town';
                  }
              });
          }
      );
  }

}