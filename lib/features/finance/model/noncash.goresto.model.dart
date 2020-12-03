class NoncashGorestoModel {
  int id;
  String namaOutlet;
  List<Data> data;

  NoncashGorestoModel({this.id, this.namaOutlet, this.data});

  NoncashGorestoModel.fromJson(Map<String, dynamic> json) {
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
  String gopay;
  String rekening;
  String selisih;
  String id;

  Data({this.gopay, this.rekening, this.selisih, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    gopay = json['gopay'];
    rekening = json['rekening'];
    selisih = json['selisih'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gopay'] = this.gopay;
    data['rekening'] = this.rekening;
    data['selisih'] = this.selisih;
    data['id'] = this.id;
    return data;
  }
}
