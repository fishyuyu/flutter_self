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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("发现"),
      ),
    );
  }

}
