import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 流布局
class FlowStudy extends StatefulWidget {
  @override
  _FlowState createState() => new _FlowState();
  
}

class _FlowState extends State<FlowStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流布局"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
               Text("Mr.Peng" * 100),
            ],
          ),
          
          Wrap(
            spacing: 8.0, // 主轴水平方向间距
            runSpacing: 4.0, // 纵轴垂直方向间距
            alignment: WrapAlignment.center, // 沿主轴方向居中
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("A"),),
                label: new Text("雪"),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("Z"),),
                label: new Text("雪雪雪雪雪雪雪"),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("X"),),
                label: new Text("雪"),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("Q"),),
                label: new Text("雪"),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("L"),),
                label: new Text("雪"),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.indigo,child: Text("Y"),),
                label: new Text("雪"),
              ),
            ],
          ),
          
          /*
           * 很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。Flow有如下优点：

性能好；Flow是一个对子组件尺寸以及位置调整非常高效的控件，Flow用转换矩阵在对子组件进行位置调整的时候进行了优化：在Flow定位过后，如果子组件的尺寸或者位置发生了变化，在FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而context.paintChild在重绘时使用了转换矩阵，并没有实际调整组件位置。
灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算每一个组件的位置，因此，可以自定义布局策略。
           缺点：

使用复杂。
不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。
           */
          Flow(
            delegate: TestFlowDelegate(margin:EdgeInsets.all(10)),
            children: <Widget>[
               new Container(width: 80.0, height:80.0, color: Colors.red,),
               new Container(width: 80.0, height:80.0, color: Colors.green,),
               new Container(width: 80.0, height:80.0, color: Colors.blue,),
               new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
               new Container(width: 80.0, height:80.0, color: Colors.brown,),
               new Container(width: 80.0, height:80.0,  color: Colors.purple,),
            ],
          ),


        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
          transform: new Matrix4.translationValues(x, y, 0.0)
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        // 绘制子widget（有优化）
        context.paintChild(i,
          transform: new Matrix4.translationValues(x, y, 0.0)
        );
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }
  
  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow 大小
    return Size(double.infinity, 300.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
  
}