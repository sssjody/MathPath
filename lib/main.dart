import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/home.dart';




void main() {
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //全局设置透明
      statusBarIconBrightness: Brightness.dark
      //light:黑色图标 dark：白色图标
    //在此处设置statusBarIconBrightness为全局设置
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(MyApp());
}

