import 'package:flutter/material.dart';

/**
 * Copyright (C), 2015-2019
 * FileName: find_page
 * Author: yulei
 * Date: 2019/5/8 12:59
 * Description: ${我的}
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class MinePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new _MinePage();
  }
}

class _MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<_MinePage> {
  @override
  Widget build(BuildContext context) {
//    new Scaffold(
//      body: new Container(
//        child: new Text("我的"),
//      ),
//    );
    return new Text("我的");
  }

}
