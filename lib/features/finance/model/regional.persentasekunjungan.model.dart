class RegionalPersentaseKunjunganModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalPersentaseKunjunganModel({this.id, this.namaOutlet, this.data});

  RegionalPersentaseKunjunganModel.fromJson(Map<String, dynamic> json) {
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
  Malam malam;
  Malam pagi1;
  Malam pagi2;
  Malam sore1;
  Malam sore2;
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
    malam = json['malam'] != null ? new Malam.fromJson(json['malam']) : null;
    pagi1 = json['pagi_1'] != null ? new Malam.fromJson(json['pagi_1']) : null;
    pagi2 = json['pagi_2'] != null ? new Malam.fromJson(json['pagi_2']) : null;
    sore1 = json['sore_1'] != null ? new Malam.fromJson(json['sore_1']) : null;
    sore2 = json['sore_2'] != null ? new Malam.fromJson(json['sore_2']) : null;
    totalKunjungan = json['total_kunjungan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.malam != null) {
      data['malam'] = this.malam.toJson();
    }
    if (this.pagi1 != null) {
      data['pagi_1'] = this.pagi1.toJson();
    }
    if (this.pagi2 != null) {
      data['pagi_2'] = this.pagi2.toJson();
    }
    if (this.sore1 != null) {
      data['sore_1'] = this.sore1.toJson();
    }
    if (this.sore2 != null) {
      data['sore_2'] = this.sore2.toJson();
    }
    data['total_kunjungan'] = this.totalKunjungan;
    data['id'] = this.id;
    return data;
  }
}

class Malam {
  String jumlah;
  String persentase;

  Malam({this.jumlah, this.persentase});

  Malam.fromJson(Map<String, dynamic> json) {
    jumlah = json['jumlah'];
    persentase = json['persentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlah'] = this.jumlah;
    data['persentase'] = this.persentase;
    return data;
  }
}
