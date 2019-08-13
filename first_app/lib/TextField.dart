import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldStudy extends StatefulWidget {
  @override
  _TextFieldState createState() => new _TextFieldState();
  
}

class _TextFieldState extends State<TextFieldStudy> {

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("输入框表单"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              controller: _nameController // 监听输入内容,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
              ),
              onChanged: (value) {
                // onChanged是专门用于监听文本变化，而controller的功能却多一些，
                // 除了能监听文本变化外，它还可以设置默认值、选择文本
                print(value); // 监听输入内容
              },
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}


// 表单
class FormTestRoute extends StatefulWidget {
  @override
  _FromTestRouteState createState() => new _FromTestRouteState();
  
}

class _FromTestRouteState extends State<FormTestRoute> {

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person),
                ),
                // 校验用户名
                validator: (value) {
                  return value.trim().length > 0 ? null : "用户名不能为空"; 
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  return value.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。 
                          if ((_formKey.currentState as FormState).validate()){
                            print("验证通过，提交数据");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}