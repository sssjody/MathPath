

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/report/imageswiper.dart';
import 'package:study/report/question_list.dart';
import 'package:study/report/questionday.dart';
import 'package:study/report/search.dart';
import 'package:study/report/studytool.dart';

class ReportPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ReportState();

}





class ReportState extends State<ReportPage>{

  MyScrollController myScrollController = MyScrollController();

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
         home: Scaffold(
             appBar: PreferredSize(
                child: SearchBar(),
               preferredSize: Size.fromHeight(70),
             ),
            body:  SingleChildScrollView(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 ImageSwiper(),
                 QuestionDay(),
                 SolvedQuestions(),
                  Container(
                    margin: EdgeInsets.only(left: 16,top: 16),
                    child: Text('学习辅助',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  StudyTool(),
                  QuestionTitle(myScrollController: myScrollController,width: MediaQuery.of(context).size.width,),
                  ScrollContainer(myScrollController: myScrollController,width: MediaQuery.of(context).size.width,),
                  QuestionList(width: MediaQuery.of(context).size.width,myScrollController: myScrollController,)
               ],
            ),
         ),

     ));
  }
}


//解决的选择题 填空题 解答题
class SolvedQuestions extends StatefulWidget{
  List type = [579,1083,432];
  List solved = [91,158,19];
  @override
  State<StatefulWidget> createState() => SolvedQuestionsState();

}

class SolvedQuestionsState extends State<SolvedQuestions>{
  @override
  Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: 14,top: 10,bottom: 10,right: 18),
       margin: EdgeInsets.only(left: 16,right: 16,top: 20),
        decoration: BoxDecoration(
           color: Color(0xffececec),
           borderRadius: BorderRadius.circular(8)
        ),
         child: Row(
            children: <Widget>[
                Column(
                  children: <Widget>[
                     Text('正确率',style: TextStyle(color: Color(0xff00CD00),fontWeight: FontWeight.bold),),
                     SizedBox(height: 8,),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                          Text('48',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                          Container(
                            margin: EdgeInsets.only(bottom: 3),
                            child: Text('%'),
                          )
                       ],
                     )
                  ],
                ),
                SizedBox(width: 28,),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('选择题'),
                            SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('${widget.solved[0]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3),
                                  child: Text('/${widget.type[0]}',style: TextStyle(fontSize: 12),),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('填空题'),
                            SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('${widget.solved[1]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3),
                                  child: Text('/${widget.type[1]}',style: TextStyle(fontSize: 12),),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('解答题'),
                            SizedBox(height: 8,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('${widget.solved[2]}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3),
                                  child: Text('/${widget.type[2]}',style: TextStyle(fontSize: 12),),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                )
            ],
         ),
     );
  }

}