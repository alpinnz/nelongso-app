class LoseRekapModel {
  String id;
  String code;
  String nama;
  String hargaJual;
  List<Data> data;

  LoseRekapModel({this.id, this.code, this.nama, this.hargaJual, this.data});

  LoseRekapModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nama = json['nama'];
    hargaJual = json['harga_jual'];
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
    data['code'] = this.code;
    data['nama'] = this.nama;
    data['harga_jual'] = this.hargaJual;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String id;
  String outletName;
  String qty;
  String total;

  Data({this.id, this.outletName, this.qty, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outletName = json['outlet_name'];
    qty = json['qty'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet_name'] = this.outletName;
    data['qty'] = this.qty;
    data['total'] = this.total;
    return data;
  }
}
