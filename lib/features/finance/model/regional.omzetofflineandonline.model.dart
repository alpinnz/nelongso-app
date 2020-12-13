class RegionalOmzetofflineandonlineModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalOmzetofflineandonlineModel({this.id, this.namaOutlet, this.data});

  RegionalOmzetofflineandonlineModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaOutlet = json['nama_outlet'];
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
    data['nama_outlet'] = this.namaOutlet;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String online;
  String offline;
  String id;

  Data({this.online, this.offline, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    online = json['online'];
    offline = json['offline'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['online'] = this.online;
    data['offline'] = this.offline;
    data['id'] = this.id;
    return data;
  }
}
