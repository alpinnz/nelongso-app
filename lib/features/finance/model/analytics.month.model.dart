class AnalyticsMonthModel {
  String no;
  String namaOutlet;
  String regional;
  List<Data> data;

  AnalyticsMonthModel({this.no, this.namaOutlet, this.regional, this.data});

  AnalyticsMonthModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
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
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['regional'] = this.regional;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String column;
  String value;

  Data({this.id, this.column, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    column = json['column'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['column'] = this.column;
    data['value'] = this.value;
    return data;
  }
}
