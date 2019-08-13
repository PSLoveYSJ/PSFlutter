

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonStudy extends StatefulWidget {
  @override
   _ButtonState createState() => new _ButtonState();
}

class _ButtonState extends State<ButtonStudy> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("按钮学习"),
        backgroundColor: CupertinoColors.white,
      ),
      body: Center (
        child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:<Widget>[
          // RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
          RaisedButton(
            child: Text("漂浮按钮"),
            onPressed: () {
              print("漂浮按钮点击了");
            },
          ),
          // 扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
          FlatButton(
            child: Text("扁平按钮"),
            onPressed: () {
              print("扁平按钮点击了");
            },
          ),
          // outline button OutlineButton默认有一个边框，
          // 不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
          OutlineButton(
            child: Text("边框按钮"),
            onPressed: () => print("边框按钮点击了"),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => print("图片按钮点击"),
          ),
          // RaiseButton OutlineButton  FlatButton 都有Icon 属性
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: () => print("添加一张图片"),
          ),
          // 自定义按钮
          RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () => print("自定义按钮点击了"),
          ),
        ],
      ),
      )
    );
  }
  
}