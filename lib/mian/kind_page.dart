import 'package:flutter/material.dart';

/**
 * Copyright (C), 2015-2019
 * FileName: find_page
 * Author: yulei
 * Date: 2019/5/8 12:59
 * Description: ${分类}
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class KindPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new _KindPage();
  }
}

class _KindPage extends StatefulWidget {

  @override
  _KindPageState createState() => _KindPageState();
}

class _KindPageState extends State<_KindPage> {
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      body: new Center(
        child: new Text("分类"),
      ),
    );
  }

}
