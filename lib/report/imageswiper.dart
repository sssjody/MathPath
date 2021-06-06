

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageSwiper extends StatefulWidget{
  final List<String> imageUrl = [
    'https://sssjody.oss-cn-beijing.aliyuncs.com/study/p1.jpeg',
    'https://sssjody.oss-cn-beijing.aliyuncs.com/study/p2.jpg',
    'https://sssjody.oss-cn-beijing.aliyuncs.com/study/p3.jpg'
  ];
  @override
  State<StatefulWidget> createState() => ImageSwiperState();
}

class ImageSwiperState extends State<ImageSwiper>{
  @override
  Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.only(left: 16,right: 16,top: 12),
          width: MediaQuery.of(context).size.width - 32,
          height: 100,
          child: Swiper(
             pagination: SwiperPagination(
                 alignment: Alignment.bottomCenter,
                 builder: DotSwiperPaginationBuilder(
                    size: 6,
                    activeSize: 6
                 )
             ),
             itemCount: widget.imageUrl.length,
             itemBuilder: (context,index){
                 return ClipRRect(
                    child: Image.network(
                   widget.imageUrl[index],
                   fit: BoxFit.cover,
                 ),
                    borderRadius: BorderRadius.circular(16),
                 );
             },
            autoplay: true,
          ),
      );
  }

}