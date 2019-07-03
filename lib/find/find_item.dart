import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_self/model/find_model.dart';

/**
 * Copyright (C), 2015-2019
 * FileName: find_page
 * Author: yulei
 * Date: 2019/5/8 12:59
 * Description: ${分类的子类}
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */

class FindItemPage extends StatelessWidget {
  // This widget is the root of your application.
  String title;

  FindItemPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new _FindItemPage(title);
  }
}

class _FindItemPage extends StatefulWidget {
  String title;

  _FindItemPage(this.title);

  @override
  _FindItemState createState() => _FindItemState(title);
}

class _FindItemState extends State<_FindItemPage> {
  String title;

  _FindItemState(this.title);

  List<ListListBean> findList = null;

  // 读取 assets 文件夹中的 find_data.json 文件
  Future<String> _loadJson() async {
    return await rootBundle.loadString('assets/find_data.json');
  }

// 将 json 字符串解析为 Person 对象
  Future<FindModel> _decodeFindData() async {
    // 获取本地的 json 字符串
    String personJson = await _loadJson();
    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
    final jsonMap = json.decode(personJson);
    print('jsonMap runType is ${jsonMap.runtimeType}');
    FindModel findModel = FindModel.fromJson(jsonMap);
    var list_data = findModel.listData;
    for (var value in list_data) {
      if (value.name == title) {
//        findList = value.list;
//        debugPrint('person name is ${findList.length}, name is ${value.name}');
        setState(() {
          findList = value.list;
        });
      }
    }
//    return findModel;
  }

  @override
  void initState() {
    super.initState();
    _decodeFindData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: findList == null
          ? SizedBox(
              width: 0,
              height: 0,
            )
          : GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 0.8),
              itemBuilder: (BuildContext context, int index) {
                return new ListItemWidget(
                    findList[index].name, findList[index].coverUrl);
              },
              itemCount: findList.length),
//          : GridView.custom(
//              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 3,
//                  mainAxisSpacing: 5.0,
//                  crossAxisSpacing: 5.0,
//                  childAspectRatio: 0.8),
//              semanticChildCount: findList.length,
//              childrenDelegate: new SliverChildBuilderDelegate((context, index) {
//                return new ListItemWidget(
//                    findList[index].name, findList[index].coverUrl);
//              }),
//            ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final String title;
  final String coverUrl;

  ListItemWidget(this.title, this.coverUrl);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.network(
              "$coverUrl",
              width: 90,
              height: 90,
            ),
            SizedBox(
              width: 0,
              height: 10,
            ),
            new Text("$title"),
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
