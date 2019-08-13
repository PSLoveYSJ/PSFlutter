import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStudy extends StatefulWidget {
  @override
  _TextView createState() => new _TextView();
  
}

class _TextView extends State<TextStudy> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold (
      navigationBar: CupertinoNavigationBar(
        middle: Text("TextStudy"),
        backgroundColor: CupertinoColors.activeOrange,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 字符串汉字重复2次
          Text("Hello world" * 2,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 10,color: CupertinoColors.black),
          ),
         Text("Hello world I'm aaa",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(fontSize: 10,color: CupertinoColors.destructiveRed),
          ),
          Text("Hello YS",
            textScaleFactor: 1.5,
            style: new TextStyle(fontSize: 10
              ,color: CupertinoColors.activeOrange),
          ),
          // 富文本
          Text.rich(TextSpan(
            children: [
              TextSpan(text: "Home"),
              TextSpan(
                text: "https://www.baidu.com",
                style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ]
          )),
          // 默认文本样式 可以不继承
          DefaultTextStyle(
            // 设置文本默认样式
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("DefaultTextStyle"),
                Text("Style"),
                Text("not inherit",
                  style: TextStyle(
                    inherit: false,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          )
          /*
          Text("Hello world",
  style: TextStyle(
    color: Colors.blue, // 颜色
    fontSize: 18.0, 字体
    height: 1.2,  行高
    fontFamily: "Courier", 指定字体 
    background: new Paint()..color=Colors.yellow,
    decoration:TextDecoration.underline, 系统字体大小改变 会不会睡着改变
    decorationStyle: TextDecorationStyle.dashed
  ),
);
          */
        ],
      ),
    );
  }
}