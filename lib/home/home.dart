import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study/home/dropdown_controller.dart';
import 'package:study/home/dropdown_header.dart';
import 'package:study/person/person.dart';
import 'package:study/report/report.dart';

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  int currentIndex = 2;
  List<Widget> pageList = [
      HomePage(),ReportPage(),
    // PersonInfoEdit()
    PersonPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index){
             if(mounted){
               setState(() {
                   currentIndex = index;
               });
             }
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe607,fontFamily: 'MyIcons')),
                label: '题库'
            ),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe69e,fontFamily: 'MyIcons')),
                label: '学习'
            ),
            BottomNavigationBarItem(
                icon: Icon(IconData(0xe624,fontFamily: 'MyIcons')),
                label: '我'
            )
          ],
        ),
      ),
    );
  }

}


class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BodyAreaState();

}

class BodyAreaState extends State<HomePage>  {

  List list = ['反比例函数','锐角三角形','一元二次方程','图形的相似','用样本推断总体',];
  List points = ['反比例函数','反比例函数的图像和性质','反比例函数的应用'];
  DropDownController controller;


  @override
  void initState() {
    super.initState();
    controller = DropDownController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:PreferredSize(
          child:  AppBar(
            title: Text('练习',style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(38),
        ),
        body: Container(
           color: Color(0xffF5F5F5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               ChooseGrade(),
               AnimationLimiter(
                   child: Expanded(
                     child: ListView.builder(
                         itemCount: list.length,
                         itemBuilder: (context, index) {
                           return AnimationConfiguration.staggeredList(
                               position: index,
                               duration: Duration(milliseconds: 600),
                               child: SlideAnimation(
                                 child: DropDownHeader(index: index,
                                   controller: controller,
                                   title: list[index],
                                   list: list,
                                   points: points,),
                               )
                           );
                         }),
                     flex: 1,
                   )
               )
             ],
           ),
        ),
      ),
    );
  }


}


class ChooseGrade extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ChooseGradeState();
}

class ChooseGradeState extends State<ChooseGrade>  {

  String grade = '七年级上';

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return GestureDetector(
         child: Container(
           margin: EdgeInsets.only(left: 16,top: 10),
           padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text(grade),
               Icon(Icons.arrow_drop_down_rounded,size: 16,)
             ],
           ),
         ),
         onTap: (){
            showBottom();
         },
      );
  }
  
  
  
  
  void showBottom() async{
     String str =  await showModalBottomSheet(
         enableDrag: false,
         context: context,
         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
         ),
         builder: (context){
            return Container(
               padding: EdgeInsets.only(top: 20),
               height: 180,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
               ),
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Text('选择年级',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                     SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            GradeContainer(grade: '七年级上',currentGrade: grade,),
                            GradeContainer(grade: '八年级上',currentGrade: grade,),
                            GradeContainer(grade: '九年级上',currentGrade: grade,)
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GradeContainer(grade: '七年级下',currentGrade: grade,),
                          GradeContainer(grade: '八年级下',currentGrade: grade,),
                          GradeContainer(grade: '九年级下',currentGrade: grade,)
                        ],
                      )
                   ],
                ),
            );
         }
     );
     if(str?.isNotEmpty ?? false){
         setState(() {
            grade = str;
         });
     }
  }


}


class GradeContainer extends StatelessWidget{
  final String currentGrade;
  final String grade;

  const GradeContainer({Key key, this.currentGrade, this.grade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
          decoration: BoxDecoration(
              color: currentGrade==grade?Color(0xffECF5FE) : Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Text(
            grade,
            style: TextStyle(color: currentGrade==grade?Color(0xff0B82F1):Colors.black),
          ),
        ),
        onTap: (){
           Navigator.of(context).pop(grade);
        },
     );
  }

}




