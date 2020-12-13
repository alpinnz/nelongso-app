class RegionalMenuModel {
  String id;
  String menu;
  String kategori;
  String status;
  List<Outlets> outlets;

  RegionalMenuModel(
      {this.id, this.menu, this.kategori, this.status, this.outlets});

  RegionalMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'];
    kategori = json['kategori'];
    status = json['status'];
    if (json['outlets'] != null) {
      outlets = new List<Outlets>();
      json['outlets'].forEach((v) {
        outlets.add(new Outlets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu'] = this.menu;
    data['kategori'] = this.kategori;
    data['status'] = this.status;
    if (this.outlets != null) {
      data['outlets'] = this.outlets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Outlets {
  String id;
  String nama;
  Data data;

  Outlets({this.id, this.nama, this.data});

  Outlets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String malam;
  String pagi;
  String sore;
  String total;

  Data({this.malam, this.pagi, this.sore, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    malam = json['malam'];
    pagi = json['pagi'];
    sore = json['sore'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['malam'] = this.malam;
    data['pagi'] = this.pagi;
    data['sore'] = this.sore;
    data['total'] = this.total;
    return data;
  }
}
