class AnalyticsTargetModel {
  String outlet;
  String regional;
  List<Data> data;

  AnalyticsTargetModel({this.outlet, this.regional, this.data});

  AnalyticsTargetModel.fromJson(Map<String, dynamic> json) {
    outlet = json['outlet'];
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
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String bulan;
  String value;

  Data({this.id, this.bulan, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bulan = json['bulan'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bulan'] = this.bulan;
    data['value'] = this.value;
    return data;
  }
}
