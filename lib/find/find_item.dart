import 'package:flutter/material.dart';
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

  String title;


  FindItemPage(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("$title"),
      ),
    );
  }
}

