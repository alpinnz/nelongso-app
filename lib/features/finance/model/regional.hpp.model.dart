class RegionalHppModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalHppModel({this.id, this.namaOutlet, this.data});

  RegionalHppModel.fromJson(Map<String, dynamic> json) {
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
  String id;
  List<Supplier> supplier;

  Data({this.id, this.supplier});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['supplier'] != null) {
      supplier = new List<Supplier>();
      json['supplier'].forEach((v) {
        supplier.add(new Supplier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.supplier != null) {
      data['supplier'] = this.supplier.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supplier {
  String nama;
  String nominal;

  Supplier({this.nama, this.nominal});

  Supplier.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nominal = json['nominal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['nominal'] = this.nominal;
    return data;
  }
}
