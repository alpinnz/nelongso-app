class RegionalOmzetpershiftModel {
  String id;
  String namaOutlet;
  List<Data> data;

  RegionalOmzetpershiftModel({this.id, this.namaOutlet, this.data});

  RegionalOmzetpershiftModel.fromJson(Map<String, dynamic> json) {
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
  String omsetMalam;
  String omsetPagi1;
  String omsetPagi2;
  String omsetSore1;
  String omsetSore2;
  String totalOmset;
  String id;

  Data(
      {this.omsetMalam,
      this.omsetPagi1,
      this.omsetPagi2,
      this.omsetSore1,
      this.omsetSore2,
      this.totalOmset,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    omsetMalam = json['omset_malam'];
    omsetPagi1 = json['omset_pagi_1'];
    omsetPagi2 = json['omset_pagi_2'];
    omsetSore1 = json['omset_sore_1'];
    omsetSore2 = json['omset_sore_2'];
    totalOmset = json['total_omset'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['omset_malam'] = this.omsetMalam;
    data['omset_pagi_1'] = this.omsetPagi1;
    data['omset_pagi_2'] = this.omsetPagi2;
    data['omset_sore_1'] = this.omsetSore1;
    data['omset_sore_2'] = this.omsetSore2;
    data['total_omset'] = this.totalOmset;
    data['id'] = this.id;
    return data;
  }
}
