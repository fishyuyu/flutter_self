import 'package:flutter/material.dart';
import 'package:flutter_self/find/find_item.dart';

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

class _KindPageState extends State<_KindPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ///标题集合
  var titles = ['题材', '进度', '受众', '媒体'];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  void dispose() {
    ///页面销毁时，销毁控制器
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
//        elevation: 0,//去掉阴影
        title: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.lightBlueAccent,
          labelColor: Colors.lightBlueAccent,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            new Tab(text: titles[0]),
            new Tab(text: titles[1]),
            new Tab(text: titles[2]),
            new Tab(text: titles[3]),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          FindItemPage(titles[0]),
          FindItemPage(titles[1]),
          FindItemPage(titles[2]),
          FindItemPage(titles[3]),
        ],
      ),
    );
  }
}
