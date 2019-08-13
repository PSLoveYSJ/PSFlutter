import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SwitchStudy extends StatefulWidget {
  @override
  _SwitchState createState() => new _SwitchState();
  
}

class _SwitchState extends State<SwitchStudy> {

  bool _switchSelected = false; // 单选框
  bool _checkboxSelected = true; // 复选框

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框，复选框"),
      ),
      body:  Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          
          value: _switchSelected,
          onChanged: (value){
            // 重新构建界面
            setState(() {
              print(value);
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.redAccent,
          onChanged: (value){
            setState(() {
              print(value);
              _checkboxSelected = value;
            });
          },
        ),
      ],
      ),
      ),
    );
  }
  
}