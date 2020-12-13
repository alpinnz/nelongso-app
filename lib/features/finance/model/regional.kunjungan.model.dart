class RegionalKunjunganModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalKunjunganModel({this.id, this.namaOutlet, this.data});

  RegionalKunjunganModel.fromJson(Map<String, dynamic> json) {
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
  String malam;
  String pagi1;
  String pagi2;
  String sore1;
  String sore2;
  String totalKunjungan;
  String id;

  Data(
      {this.malam,
      this.pagi1,
      this.pagi2,
      this.sore1,
      this.sore2,
      this.totalKunjungan,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    malam = json['malam'];
    pagi1 = json['pagi_1'];
    pagi2 = json['pagi_2'];
    sore1 = json['sore_1'];
    sore2 = json['sore_2'];
    totalKunjungan = json['total_kunjungan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['malam'] = this.malam;
    data['pagi_1'] = this.pagi1;
    data['pagi_2'] = this.pagi2;
    data['sore_1'] = this.sore1;
    data['sore_2'] = this.sore2;
    data['total_kunjungan'] = this.totalKunjungan;
    data['id'] = this.id;
    return data;
  }
}
