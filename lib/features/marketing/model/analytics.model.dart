class AnalyticsModel {
  String id;
  String outletName;
  String regional;
  List<Data> data;

  AnalyticsModel({this.id, this.outletName, this.regional, this.data});

  AnalyticsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outletName = json['outlet_name'];
    regional = json['regional'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet_name'] = this.outletName;
    data['regional'] = this.regional;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String month;
  String value;

  Data({this.id, this.month, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    month = json['month'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['month'] = this.month;
    data['value'] = this.value;
    return data;
  }
}
