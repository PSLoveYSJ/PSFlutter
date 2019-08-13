
// material UI组件
import 'package:first_app/EnglishWords.dart';
import 'package:first_app/Indicator.dart';
import 'package:first_app/StateManager.dart';
import 'package:first_app/Switch.dart';
import 'package:first_app/TextField.dart';
import 'package:first_app/button.dart';
import 'package:first_app/image.dart';
import 'package:first_app/newRoute.dart';
import 'package:first_app/text.dart';
import 'package:first_app/widgget_study.dart';
import 'package:flutter/material.dart';

// 应用入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /*
   * Scaffold 是Material库中提供的页面脚手架
   * 它包含导航栏和Body以及FloatingActionButton（如果需要的话）
   * 本书后面示例中，路由默认都是通过Scaffold创建
   */
  @override
  Widget build(BuildContext context) {
    /**
     * 是Material库中提供的Flutter APP框架
     * 通过它可以设置应用的名称、主题、语言、首页及路由列表等
     * MaterialApp也是一个widget
     */
    return MaterialApp(
      title: '应用名称',
      theme: ThemeData(
        /**
         * 主题
         */
        primarySwatch: Colors.green,
      ),
      /**
       * 应用首页
       */
      home: MyHomePage(title: 'Flutter 首页'),
    );
  }
}

// 主页 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // 
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final String _name = "PengShuai";

  void _incrementCounter() {
    /**
     * 函数作用是先自增_counter
     * ->调用setState 方法
     * setState通知Flutter框架有状态发生了改变
     * Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
     *  Flutter 对此方法做了优化
     * 使重新执行变的很快，所以你可以重新构建任何需要更新的东西
     * 而无需分别去修改各个widget
     */
    setState(() {
      _counter++;
    });
  }

  /*
   * 为什么build 方法不放在StatefulWidget中
   * 1. 状态访问不方便
   * 状态改变都要调用build方法，状态保存在State中，如果build方法在StatefulWidget中，
   * 那么build方法和状态分别在两个类中那么构建时读取状态将会很不方便！
   * 试想一下，如果真的将build方法放在StatefulWidget中的话，
   * 由于构建用户界面过程需要依赖State，所以build方法将必须加一个State参数,
   * 2. 继承StatefulWidget不便 
   */
  @override
  Widget build(BuildContext context) {
    /**
     * Material组件库中提供的一个组件
     * 它提供了默认的导航栏、标题和包含主屏幕widget树
     * （后同”组件树“或”部件树“）的body属性。组件树可以很复杂
     */
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /**
       * body的组件树中包含了一个Center 组件，
       * Center 可以将其子组件树对齐到屏幕中心。
       * 此例中， Center 子组件是一个Column 组件，
       * Column的作用是将其所有子组件沿屏幕垂直方向依次排列； 
       * 此例中Column子组件是两个 Text，
       * 第一个Text 显示固定文本 “You have pushed the button this many times:”，
       * 第二个Text 显示_counter状态的数值。
       */
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter' + '$_name',
              style: Theme.of(context).textTheme.display1,
            ),
            // 英文随机单词
            EnglishWords(),

            FlatButton(
               child: Text("输入框"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TextFieldStudy();
                 }));
                 },
            ),

            FlatButton(
               child: Text("表单"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FormTestRoute();
                 }));
                 },
            ),

             FlatButton(
               child: Text("进度条"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ProgressStudy();
                 }));
                 },
            ),

            FlatButton(
               child: Text("管理自身状态"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TapboxA();
                 }));
                 },
            ),

            FlatButton(
               child: Text("图片管理"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ImageStudy();
                 }));
                 },
            ),

            FlatButton(
               child: Text("父Widget管理子Widget"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ParentWidget();
                 }));
                 },
            ),

            FlatButton(
               child: Text("混合状态管理"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ParentWidgetC();
                 }));
                 },
            ),

            FlatButton(
               child: Text("Text文本管理"),
               textColor: Colors.greenAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return TextStudy();
                 }));
                 },
            ),
            FlatButton(
               child: Text("单选开关与复选开关"),
               textColor: Colors.greenAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SwitchStudy();
                 }));
                 },
            ),

            FlatButton(
               child: Text("按钮学习"),
               textColor: Colors.redAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ButtonStudy();
                 }));
                 },
            ),

            
            FlatButton(
               child: Text("WidggetStudy"),
               textColor: Colors.orangeAccent,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return WidggetStudy();
                 }));
                 },
            ),

            FlatButton(
               child: Text("newRoute"),
               textColor: Colors.indigo,
               onPressed: (){
                 /**
                  * MaterialPageRoute继承自PageRoute类 PageRoute类是一个抽象类，
                  * 表示占有整个屏幕空间的一个模态路由页面，
                  * 它还定义了路由构建及切换时过渡动画的相关接口及属性
                  * MaterialPageRoute 是Material组件库提供的组件，
                  * 它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画：
                   WidgetBuilder builder, // 是一个WidgetBuilder类型的回调函数，它的作用是构建路由页面的具体内容，返回值是一个widget
    RouteSettings settings,包含路由的配置信息，如路由名称、是否初始路由（首页）
    bool maintainState = true // 仍然保存在内存中 , // false 没用的时候释放占有的资源 
    bool fullscreenDialog = false //,  
                  */
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NewRoute();
                 }));
                 },
            )
          ],
        ),
      ),
      /**
       * 是页面右下角的带“+”的悬浮按钮
       * 它的onPressed属性接受一个回调函数代表它被点击后的处理器
       * 本例中直接将_incrementCounter方法作为其处理函数
       */
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
  
    );
  }
}
