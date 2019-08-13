import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressStudy extends StatefulWidget {
  @override
  _ProgressState createState() => new _ProgressState();
}

class _ProgressState extends State<ProgressStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度指示器"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            // 自定义大小
            SizedBox(
              height: 1,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .8,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .76,
            ),
            // 自定义大小
            SizedBox(
              height: 110,
              width: 110,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .76,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
