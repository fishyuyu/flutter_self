import 'package:flutter/material.dart';
import 'package:flutter_self/mian/find_page.dart';
import 'package:flutter_self/mian/home_page.dart';
import 'package:flutter_self/mian/kind_page.dart';
import 'package:flutter_self/mian/mine_page.dart';
/**
 * Copyright (C), 2015-2019, 武汉飔拓科技有限公司
 * FileName: find_page
 * Author: yulei
 * Date: 2019/5/8 12:59
 * Description: ${DESCRIPTION}
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  /// 选中页面的索引
  int index = 0;

  ///底部标题集合
  var appBarTitles = ['首页', '分类', '书架', '我的'];

  ///底部图片集合
  var bottomTabImages;

  ///界面集合
  var _pageCtr;
  @override
  void initState() {
    _pageCtr = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void dispose() {
    _pageCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return new Scaffold(
      body:PageView(
        controller: _pageCtr,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          KindPage(),
          FindPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
//    return new PersonalPage();
  }

  ///
  /// 初始化一些数据
  ///
  ///
  void _initData() {
    /// 底部图片集合
    bottomTabImages = [
      [
        _getTabImage('images/bar_home.png'),
        _getTabImage('images/bar_home_select.png')
      ],
      [
        _getTabImage('images/bar_kind.png'),
        _getTabImage('images/bar_kind_select.png')
      ],
      [
        _getTabImage('images/bar_find.png'),
        _getTabImage('images/bar_find_select.png')
      ],
      [
        _getTabImage('images/bar_mine.png'),
        _getTabImage('images/bar_mine_select.png')
      ]
    ];
  }

  ///
  ///    根据image路径获取图片
  /// 这个图片的路径需要在 pubspec.yaml 中去定义
  ///
  Image _getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 21.0);
  }

  ///
  ///获取底部按钮
  ///
  _getBottomNavigationBar() {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: _getTabIcon(0), title: getTabTitle(0)),
        new BottomNavigationBarItem(
            icon: _getTabIcon(1), title: getTabTitle(1)),
        new BottomNavigationBarItem(
            icon: _getTabIcon(2), title: getTabTitle(2)),
        new BottomNavigationBarItem(
            icon: _getTabIcon(3), title: getTabTitle(3)),
      ],
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      onTap: _switchPage,
    );
  }

  ///
  /// 切换界面
  ///
  _switchPage(int value) {
    setState(() {
      this.index = value;
      _pageCtr.jumpToPage(index);
    });
  }

  ///
  /// 根据索引获取所对应的标题
  ///
  getTabTitle(int page) {
    if (page == index) {
      return new Text(appBarTitles[page],
          style: new TextStyle(color: Colors.red, fontSize: 12.0));
    } else {
      return new Text(appBarTitles[page],
          style: new TextStyle(color: const Color(0xffbebebe), fontSize: 12.0));
    }
  }

  ///
  /// 根据索引获取所对应的icon
  ///
  _getTabIcon(int page) {
    if (page == index) {
      return bottomTabImages[page][1];
    } else {
      return bottomTabImages[page][0];
    }
  }

}
