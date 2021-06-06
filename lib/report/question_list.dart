


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionItem{
   bool hasCollect;
  final int year;
  final String province;
  final String title;
  final bool hasFinished;

  QuestionItem({this.hasCollect, this.year, this.province, this.title, this.hasFinished});
}







class QuestionList extends StatefulWidget{
  final double width;
  final MyScrollController myScrollController;
   List<QuestionItem> list = [
      QuestionItem(year: 2020,province: '北京',title: '2020年中考数学北京市卷',hasFinished:  true,hasCollect: false),
      QuestionItem(year: 2019,province: '上海',title: '2019年中考数学上海市卷',hasFinished: false,hasCollect: true),
     QuestionItem(year: 2018,province: '天津',title: '2018年中考数学天津市卷',hasFinished: true,hasCollect: false),
     QuestionItem(year: 2020,province: '重庆',title: '2020年中考数学重庆市卷(a卷)',hasFinished: false,hasCollect: false),
     QuestionItem(year: 2018,province: '安徽',title: '2018年中考数学安徽省卷',hasFinished: true,hasCollect: false),
     QuestionItem(year: 2019,province: '福建',title: '2019年中考数学福建省卷点点滴滴得到的得到',hasFinished: false,hasCollect: true)
  ];

 List<QuestionItem> mockList = [
     QuestionItem(year: 2020,province: '重庆',title: '重庆市八中2020年中考数学一模',hasFinished: true,hasCollect: false),
    QuestionItem(year: 2020,province: '深圳',title: '2020年广东省深圳高级中学北校区中考数学一模',hasFinished: true,hasCollect: false),
    QuestionItem(year: 2016,province: '天津',title: '天津市2016年九年级中考数学模拟题',hasCollect: false,hasFinished: false),
   QuestionItem(year: 2016,province: '武汉',title: '2016届武汉市硚口区中考数学二模',hasFinished: false,hasCollect: false),
   QuestionItem(year: 2016,province: '杭州',title: '浙江省杭州2017届九年级下3月模拟数学试卷',hasCollect: false,hasFinished: true)
 ];

 List<QuestionItem> hardList = [
   QuestionItem(year: 2020,province: '重庆',title: '重庆市八中2020年中考数学一模',hasFinished: true,hasCollect: false),
   QuestionItem(year: 2020,province: '深圳',title: '2020年广东省深圳高级中学北校区中考数学一模',hasFinished: true,hasCollect: false),
   QuestionItem(year: 2016,province: '天津',title: '天津市2016年九年级中考数学模拟题',hasCollect: false,hasFinished: false),
   QuestionItem(year: 2016,province: '武汉',title: '2016届武汉市硚口区中考数学二模',hasFinished: false,hasCollect: false),
   QuestionItem(year: 2016,province: '杭州',title: '浙江省杭州2017届九年级下3月模拟数学试卷',hasCollect: false,hasFinished: true)
 ];



  QuestionList({Key key, this.width, this.myScrollController}) : super(key: key);


  @override
  State<StatefulWidget> createState() => QuestionListState();

}

class QuestionListState extends State<QuestionList>{
  ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(() {
       setState(() {
        // print(controller.offset);
          widget.myScrollController.setOffset(controller.offset);
       });

    });
  }

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
         controller: controller,
         physics: PageScrollPhysics().applyTo(BouncingScrollPhysics()),
         scrollDirection: Axis.horizontal,
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width,
               height: 400,
               color: Color(0xffF5F5F5), // Color(0xffF5F5F5),
             //  margin: EdgeInsets.only(bottom: 30),
               child: ListView.builder(
                   shrinkWrap: true,
                   physics: ClampingScrollPhysics(),
                   itemCount: widget.list.length,
                   itemBuilder: (context,index){
                      return QuestionItemWidget(widget.list.length,index,widget.list[index]);
                   },
               )
             ),
             Container(

               width: MediaQuery.of(context).size.width,
               height: 400,
               color: Color(0xffF5F5F5),
         //      margin: EdgeInsets.only(bottom: 30),
               child: ListView.builder(
                 shrinkWrap: true,
                 physics: ClampingScrollPhysics(),
                 itemCount: widget.mockList.length,
                 itemBuilder: (context,index){
                   return QuestionItemWidget(widget.mockList.length,index,widget.mockList[index]);
                 },
               ),
             ),
             Container(
               width: MediaQuery.of(context).size.width,
               height: 400,
               color: Color(0xffF5F5F5),
               //   margin: EdgeInsets.only(bottom: 30),
               child: ListView.builder(
                 shrinkWrap: true,
                 physics: ClampingScrollPhysics(),
                 itemCount: widget.hardList.length,
                 itemBuilder: (context,index){
                   return QuestionItemWidget(widget.hardList.length,index,widget.hardList[index]);
                 },
               ),
             )
           ],
         )
     );
  }
}
/*
* 
* 题目控件
* **/
class QuestionItemWidget extends StatelessWidget{
  int index;
  int length;
  QuestionItem item;

  QuestionItemWidget(this.length,this.index,this.item);

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(left: 24,right: 24,top: 16,bottom: index == length - 1 ? 20 : 0),
        padding: EdgeInsets.only(top: 13,bottom: 13,left: 14,right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Container(
                         alignment: Alignment.center,
                         padding: EdgeInsets.only(left: 3,right: 3,bottom: 1,top: 2),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(4),
                             color: item.year == 2020 ? Colors.redAccent : item.year == 2019 ? Colors.orangeAccent : Colors.green
                         ),
                         child: Text('${item.year}',style: TextStyle(color: Colors.white,fontSize: 11,) ),
                       ),
                       SizedBox(width: 4,),
                       Text(item.province,style: TextStyle(fontSize: 12),)
                     ],
                   ),
                   SizedBox(height: 13,),
                   Row(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[
                       Icon(Icons.done_rounded,color: item.hasFinished ?  Colors.green : Colors.grey,size: 18,) ,
                       SizedBox(width: 3,),
                       Container(width: MediaQuery.of(context).size.width - 122,child: Text(item.title,style: TextStyle(fontSize: 15.8,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,maxLines: 1,))
                     ],
                   )
                 ],
               ),
               CollectWidget(hasCollected: item.hasCollect,item: item,)
             ],
          ),
      );
  }
  
}

/*
* 收藏图标控件
* **/

class CollectWidget extends StatefulWidget{
   bool hasCollected;
   QuestionItem item;
   CollectWidget({Key key, this.hasCollected,this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
      return CollectWidgetState();
  }

}

class CollectWidgetState extends State<CollectWidget> with SingleTickerProviderStateMixin{
  Icon noCollect = const Icon(Icons.star_outline_rounded,color: Colors.grey,);
  Icon collect = const Icon(Icons.star_rounded,color: Color(0xffFFD700),);
  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 100));
    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0,end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3,end: 1.0), weight: 50)
    ]).animate(_controller);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return ScaleTransition(
          scale: _animation,
          child: widget.hasCollected ?
               InkWell(child: collect, onTap: tapIcon,) :
               InkWell(child: noCollect,onTap: tapIcon,)
      );
  }

  void tapIcon(){
      if(_controller.status == AnimationStatus.forward ||
         _controller.status == AnimationStatus.reverse){
        return;
      }
      setState(() {
         widget.hasCollected = !widget.hasCollected;
         widget.item.hasCollect = widget.hasCollected;
         if(_controller.status == AnimationStatus.completed){
           _controller.reverse();
         }else{
           _controller.forward();
         }
      });
  }

}







/*
* 
* 滑动控制
* **/
class MyScrollController extends ChangeNotifier{
   double currentOffset = 0.0;

   void setOffset(double offset){
      this.currentOffset = offset;
      notifyListeners();
   }
}

class ScrollContainer extends StatefulWidget{
  final MyScrollController myScrollController;
  final double width;

  const ScrollContainer({Key key, this.myScrollController, this.width}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScrollContainerState();
}

class ScrollContainerState extends State<ScrollContainer>{

  @override
  void initState() {
    super.initState();
    widget.myScrollController.addListener(() {
         setState(() {

         });
    });
  }
  @override
  Widget build(BuildContext context) {
      return Transform.translate(
        offset: Offset(widget.width / 6 - 24 + (widget.myScrollController.currentOffset) / 3, 0.0),
        child: Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blueAccent
          ),
        ),
      );
  }
}



/*
* 
*  题目标题
* **/
class QuestionTitle extends StatefulWidget{
  final MyScrollController myScrollController;
  final double width;

  const QuestionTitle({Key key, this.myScrollController, this.width}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuestionTitleState();
}

class QuestionTitleState extends State<QuestionTitle>{


  @override
  void initState() {
    super.initState();
    widget.myScrollController.addListener(() {
         setState(() {

         });
    });

  }



  @override
  Widget build(BuildContext context) {
     double cubeOffset = widget.width / 6 - 24 + (widget.myScrollController.currentOffset) / 3 ;


      return Container(
        padding: EdgeInsets.only(top: 16,bottom: 6),
        //  margin: EdgeInsets.only(left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('中考真题',style: TextStyle(
                  fontSize: 15,
                  color: cubeOffset <= widget.width / 3 ? Colors.black : Colors.grey,
                  fontWeight: cubeOffset <= widget.width / 3 ? FontWeight.bold : FontWeight.normal
              ),),
              Text('模拟试卷',style: TextStyle(
                  fontSize: 15,
                  color: cubeOffset < (widget.width * 2) / 3 && cubeOffset > widget.width  / 3 ? Colors.black : Colors.grey,
                  fontWeight: cubeOffset < (widget.width * 2) / 3 && cubeOffset > widget.width  / 3 ? FontWeight.bold : FontWeight.normal
              ),),
              Text('初中竞赛',style: TextStyle(
                  fontSize: 15,
                  color: cubeOffset >= (widget.width * 2) / 3 ? Colors.black : Colors.grey,
                  fontWeight: cubeOffset >= (widget.width * 2) / 3 ? FontWeight.bold : FontWeight.normal
              ),)
            ],
          ),
      );
  }
}