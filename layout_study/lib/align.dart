import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignStudy extends StatefulWidget {
  @override
  _AlignState createState() => new _AlignState();

}

/*
 * alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset，我们将在下面的示例中详细介绍。
widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。
 Alignment

Alignment继承自AlignmentGeometry，表示矩形内的一个点，他有两个属性x、y，分别表示在水平和垂直方向的偏移，Alignment定义如下：
FractionalOffset

FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。FractionalOffset的坐标转换公式为：

Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：

(Alignment.x*childWidth/2+childWidth/2, Alignment.x*childHeight+childHeight/2)

FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。FractionalOffset的坐标转换公式为：

实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)

 */
class _AlignState extends State<AlignStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[700],
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Container(
            height: 200.0,
            width: 200.0,
            color: Colors.greenAccent[100],
            child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.center,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}