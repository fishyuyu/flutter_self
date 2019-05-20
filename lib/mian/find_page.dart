import 'package:flutter/material.dart';

/**
 * Copyright (C), 2015-2019
 * FileName: find_page
 * Author: yulei
 * Date: 2019/5/8 12:59
 * Description: ${发现}
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class FindPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new _FindPage();
  }
}

class _FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<_FindPage> {
  var titles = ['题材', '进度', '受众', '媒体','题材', '进度', '受众', '媒体','题材', '进度', '受众', '媒体'
  ,'题材', '进度', '受众', '媒体','题材', '进度', '受众', '媒体','题材', '进度', '受众', '媒体'];
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      body: new Center(
//        child: new Text("发现"),
//      ),
    
    
    body: GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.0),
        itemBuilder: (BuildContext context, int index) {
          return new ListItemWidget(titles[index]);
        },
        itemCount: titles.length),
    
    );
  }

}



class ListItemWidget extends StatelessWidget {
  final String title;

  ListItemWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        color: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("$title"),
            new Text("$title")
          ],
        ),
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("$title"),
        ));
      },
    );
  }
}
