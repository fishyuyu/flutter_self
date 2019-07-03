class FindModel {
  List<ListDataListBean> listData;

  FindModel({this.listData});

  FindModel.fromJson(Map<String, dynamic> json) {    
    this.listData = (json['list_data'] as List)!=null?(json['list_data'] as List).map((i) => ListDataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_data'] = this.listData != null?this.listData.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class ListDataListBean {
  String name;
  int type;
  List<ListListBean> list;

  ListDataListBean({this.name, this.type, this.list});

  ListDataListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.type = json['type'];
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class ListListBean {
  String coverUrl;
  String name;
  String typeId;

  ListListBean({this.coverUrl, this.name, this.typeId});

  ListListBean.fromJson(Map<String, dynamic> json) {    
    this.coverUrl = json['coverUrl'];
    this.name = json['name'];
    this.typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coverUrl'] = this.coverUrl;
    data['name'] = this.name;
    data['typeId'] = this.typeId;
    return data;
  }
}
