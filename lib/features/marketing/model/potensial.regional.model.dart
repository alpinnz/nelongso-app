class PotensialRegionalModel {
  String id;
  String namaOutlet;
  List<Data> data;

  PotensialRegionalModel({this.id, this.namaOutlet, this.data});

  PotensialRegionalModel.fromJson(Map<String, dynamic> json) {
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
  Supplier supplier;

  Data({this.id, this.supplier});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.supplier != null) {
      data['supplier'] = this.supplier.toJson();
    }
    return data;
  }
}

class Supplier {
  String omzet;
  String loseSale;
  String potensialOmzet;

  Supplier({this.omzet, this.loseSale, this.potensialOmzet});

  Supplier.fromJson(Map<String, dynamic> json) {
    omzet = json['omzet'];
    loseSale = json['lose_sale'];
    potensialOmzet = json['potensial_omzet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['omzet'] = this.omzet;
    data['lose_sale'] = this.loseSale;
    data['potensial_omzet'] = this.potensialOmzet;
    return data;
  }
}
