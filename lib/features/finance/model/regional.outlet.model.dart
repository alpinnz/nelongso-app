class RegionalOutletModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalOutletModel({this.id, this.namaOutlet, this.data});

  RegionalOutletModel.fromJson(Map<String, dynamic> json) {
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
  String omzet;
  String hpp;
  String setoranKotor;
  String margin;
  String operasional;
  String setoranBersih;
  String stokBahanBaku;
  String grab;
  String gojek;
  String ppn;
  String gudang;
  String beliDiluar;
  String id;

  Data(
      {this.omzet,
      this.hpp,
      this.setoranKotor,
      this.margin,
      this.operasional,
      this.setoranBersih,
      this.stokBahanBaku,
      this.grab,
      this.gojek,
      this.ppn,
      this.gudang,
      this.beliDiluar,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    omzet = json['omzet'];
    hpp = json['hpp'];
    setoranKotor = json['setoran_kotor'];
    margin = json['margin'];
    operasional = json['operasional'];
    setoranBersih = json['setoran_bersih'];
    stokBahanBaku = json['stok_bahan_baku'];
    grab = json['grab'];
    gojek = json['gojek'];
    ppn = json['ppn'];
    gudang = json['gudang'];
    beliDiluar = json['beli_diluar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['omzet'] = this.omzet;
    data['hpp'] = this.hpp;
    data['setoran_kotor'] = this.setoranKotor;
    data['margin'] = this.margin;
    data['operasional'] = this.operasional;
    data['setoran_bersih'] = this.setoranBersih;
    data['stok_bahan_baku'] = this.stokBahanBaku;
    data['grab'] = this.grab;
    data['gojek'] = this.gojek;
    data['ppn'] = this.ppn;
    data['gudang'] = this.gudang;
    data['beli_diluar'] = this.beliDiluar;
    data['id'] = this.id;
    return data;
  }
}
