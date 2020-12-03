class NoncashGojekandgrabModel {
  int id;
  String namaOutlet;
  List<Data> data;

  NoncashGojekandgrabModel({this.id, this.namaOutlet, this.data});

  NoncashGojekandgrabModel.fromJson(Map<String, dynamic> json) {
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
  String ovo;
  String uangFisik;
  String nb;
  String totalSuplyer;
  String setoranBersih;
  String ppn;
  String koreksi;
  String totalUangNonCash;
  String id;

  Data(
      {this.gopay,
      this.ovo,
      this.uangFisik,
      this.nb,
      this.totalSuplyer,
      this.setoranBersih,
      this.ppn,
      this.koreksi,
      this.totalUangNonCash,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    gopay = json['gopay'];
    ovo = json['ovo'];
    uangFisik = json['uang_fisik'];
    nb = json['nb'];
    totalSuplyer = json['total_suplyer'];
    setoranBersih = json['setoran_bersih'];
    ppn = json['ppn'];
    koreksi = json['koreksi'];
    totalUangNonCash = json['total_uang_non_cash'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gopay'] = this.gopay;
    data['ovo'] = this.ovo;
    data['uang_fisik'] = this.uangFisik;
    data['nb'] = this.nb;
    data['total_suplyer'] = this.totalSuplyer;
    data['setoran_bersih'] = this.setoranBersih;
    data['ppn'] = this.ppn;
    data['koreksi'] = this.koreksi;
    data['total_uang_non_cash'] = this.totalUangNonCash;
    data['id'] = this.id;
    return data;
  }
}
