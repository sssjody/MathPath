
import 'package:flutter/material.dart';
import 'package:study/home/dropdown_controller.dart';
import 'dart:math';


class DropDownHeader extends StatefulWidget{
  final int index;
  final DropDownController controller;
  final List list;
  final String title;
  final List points;

  const DropDownHeader({Key key, this.index, this.controller, this.list, this.title, this.points}) : super(key: key);


  @override
  State<StatefulWidget> createState() => DropDownHeaderState();
}

class DropDownHeaderState extends State<DropDownHeader> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> animation;
  bool hasSelected = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
         if(widget.controller.hideOthers&&widget.controller.isShow&&widget.controller.index==widget.index){
             _controller.reverse();
         }
    });
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    animation = Tween(begin: 0.0,end: (widget.points.length+1)*23.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
              ..addListener(() {
                if(mounted){
                    setState(() {});
                 }
              });
  }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: widget.index==0?10:16),
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                      bottomRight: Radius.circular(animation.value==0?6:0),
                      bottomLeft: Radius.circular(animation.value==0?6:0)
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('第${widget.index+1}章',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Text(widget.list[widget.index],style: TextStyle(color: Color(0xff999999),),)
                    ],
                  ),
                  Arrow(controller: widget.controller,index: widget.index,)
                ],
              ),
            ),
            onTap: (){
              if(widget.controller.isShow){
                if(widget.controller.index==widget.index){
                  widget.controller.hide();
                  _controller.reverse();
                }else{
                  widget.controller.hideOther();
                  widget.controller.hide();
                  widget.controller.show(widget.index);
                  _controller.forward();
                }
              }else{
                widget.controller.show(widget.index);
                _controller.forward();
              }
            },
          ) ,
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight: Radius.circular(6))
              ),
              height: animation.value,
              margin: EdgeInsets.only(left: 16,right: 16,bottom: widget.index==widget.list.length-1?30:0),
              child: ListView.builder(
                  itemCount: widget.points.length,
                  itemBuilder: (context,index){
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 16,right: 16),
                      margin: EdgeInsets.only(bottom: 8),
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget.points[index]),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color(0xffECF5FE),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Text('去练习',style: TextStyle(fontSize: 12,color: Color(0xff0B82F1)),),
                          )
                        ],
                      ),
                    );
                  }
              ))
        ],
      );
  }
}



class Arrow extends StatefulWidget{
  final DropDownController controller;
  final int index;
  const Arrow({Key key, this.controller, this.index}) : super(key: key);


  @override
  State<StatefulWidget> createState() => ArrowState();
}

class ArrowState extends State<Arrow> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> rotate;

  bool hasSelected = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    rotate = Tween(begin: 0.0,end: pi).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))..addListener(() {
       //  print(rotate.value);
         setState(() {

         });
    });

    widget.controller.addListener(() {
      if(widget.controller.isShow&&widget.controller.index==widget.index){
           _controller.forward();
           hasSelected = true;
      }else if(hasSelected){
        _controller.reverse();
        hasSelected = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
         decoration: BoxDecoration(
            color: Color(0xffECF5FE),
            shape: BoxShape.circle
         ),
         child: Transform.rotate(
             angle: rotate.value,
             child: Icon(Icons.keyboard_arrow_down,color: Colors.blueAccent,),
         )
      );
  }
}