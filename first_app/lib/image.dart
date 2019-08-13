import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageStudy extends StatefulWidget {
  @override
  _ImageState createState() => new _ImageState();
}

class _ImageState extends State<ImageStudy> {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons += "\uE914";
    icons += "\uE000";
    icons += "\uE90D";
    var image = AssetImage("images/timg.jpeg");
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("图片学习"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: image,
              width: 147.0,
              height: 70,
            ),
            // 网络图片
            Image(
              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565673099546&di=fdc196351b442650b8ee4e5bc917341d&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fcf1cd4efdaf8a4cdf120ba3ee67e5e3d8bf05aa0160bd-oHLWaH_fw658"),
              width: 100.0,
            ),
            Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565673099546&di=fdc196351b442650b8ee4e5bc917341d&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fcf1cd4efdaf8a4cdf120ba3ee67e5e3d8bf05aa0160bd-oHLWaH_fw658",
              width: 200.0,
            ),
            Text(icons,
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green
              ),
            )
          ],
        ),
      ),
    );
  }
  
}