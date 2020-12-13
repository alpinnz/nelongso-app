class RegionalOperasionalModel {
  String id;
  String namaOutlet;
  Operasional operasional;

  RegionalOperasionalModel({this.id, this.namaOutlet, this.operasional});

  RegionalOperasionalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaOutlet = json['nama_outlet'];
    operasional = json['operasional'] != null
        ? new Operasional.fromJson(json['operasional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_outlet'] = this.namaOutlet;
    if (this.operasional != null) {
      data['operasional'] = this.operasional.toJson();
    }
    return data;
  }
}

class Operasional {
  String bensin;
  String listrik;
  String pdam;
  String wifi;
  String sedotLembah;
  String sewaMess;
  String sedekah;
  Atk atk;
  Peralatan peralatan;
  Perlengkapan perlengkapan;
  LainLain lainLain;

  Operasional(
      {this.bensin,
      this.listrik,
      this.pdam,
      this.wifi,
      this.sedotLembah,
      this.sewaMess,
      this.sedekah,
      this.atk,
      this.peralatan,
      this.perlengkapan,
      this.lainLain});

  Operasional.fromJson(Map<String, dynamic> json) {
    bensin = json['bensin'];
    listrik = json['listrik'];
    pdam = json['pdam'];
    wifi = json['wifi'];
    sedotLembah = json['sedot_lembah'];
    sewaMess = json['sewa_mess'];
    sedekah = json['sedekah'];
    atk = json['atk'] != null ? new Atk.fromJson(json['atk']) : null;
    peralatan = json['peralatan'] != null
        ? new Peralatan.fromJson(json['peralatan'])
        : null;
    perlengkapan = json['perlengkapan'] != null
        ? new Perlengkapan.fromJson(json['perlengkapan'])
        : null;
    lainLain = json['lain_lain'] != null
        ? new LainLain.fromJson(json['lain_lain'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bensin'] = this.bensin;
    data['listrik'] = this.listrik;
    data['pdam'] = this.pdam;
    data['wifi'] = this.wifi;
    data['sedot_lembah'] = this.sedotLembah;
    data['sewa_mess'] = this.sewaMess;
    data['sedekah'] = this.sedekah;
    if (this.atk != null) {
      data['atk'] = this.atk.toJson();
    }
    if (this.peralatan != null) {
      data['peralatan'] = this.peralatan.toJson();
    }
    if (this.perlengkapan != null) {
      data['perlengkapan'] = this.perlengkapan.toJson();
    }
    if (this.lainLain != null) {
      data['lain_lain'] = this.lainLain.toJson();
    }
    return data;
  }
}

class Atk {
  String thermal;
  String fc;
  String atk1;
  String atk2;
  String atk3;
  String atk4;
  String atk5;
  String atk6;
  String totalAtk;

  Atk(
      {this.thermal,
      this.fc,
      this.atk1,
      this.atk2,
      this.atk3,
      this.atk4,
      this.atk5,
      this.atk6,
      this.totalAtk});

  Atk.fromJson(Map<String, dynamic> json) {
    thermal = json['thermal'];
    fc = json['fc'];
    atk1 = json['atk1'];
    atk2 = json['atk2'];
    atk3 = json['atk3'];
    atk4 = json['atk4'];
    atk5 = json['atk5'];
    atk6 = json['atk6'];
    totalAtk = json['total_atk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thermal'] = this.thermal;
    data['fc'] = this.fc;
    data['atk1'] = this.atk1;
    data['atk2'] = this.atk2;
    data['atk3'] = this.atk3;
    data['atk4'] = this.atk4;
    data['atk5'] = this.atk5;
    data['atk6'] = this.atk6;
    data['total_atk'] = this.totalAtk;
    return data;
  }
}

class Peralatan {
  String shooper;
  String blender;
  String regulator;
  String peralatan1;
  String peralatan2;
  String peralatan3;
  String peralatan4;
  String peralatan5;
  String totalPeralatan;

  Peralatan(
      {this.shooper,
      this.blender,
      this.regulator,
      this.peralatan1,
      this.peralatan2,
      this.peralatan3,
      this.peralatan4,
      this.peralatan5,
      this.totalPeralatan});

  Peralatan.fromJson(Map<String, dynamic> json) {
    shooper = json['shooper'];
    blender = json['blender'];
    regulator = json['regulator'];
    peralatan1 = json['peralatan1'];
    peralatan2 = json['peralatan2'];
    peralatan3 = json['peralatan3'];
    peralatan4 = json['peralatan4'];
    peralatan5 = json['peralatan5'];
    totalPeralatan = json['total_peralatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shooper'] = this.shooper;
    data['blender'] = this.blender;
    data['regulator'] = this.regulator;
    data['peralatan1'] = this.peralatan1;
    data['peralatan2'] = this.peralatan2;
    data['peralatan3'] = this.peralatan3;
    data['peralatan4'] = this.peralatan4;
    data['peralatan5'] = this.peralatan5;
    data['total_peralatan'] = this.totalPeralatan;
    return data;
  }
}

class Perlengkapan {
  String obat;
  String sabut;
  String perlengkapan1;
  String perlengkapan2;
  String perlengkapan3;
  String perlengkapan4;
  String perlengkapan5;
  String perlengkapan6;
  String totalPerlengkapan;

  Perlengkapan(
      {this.obat,
      this.sabut,
      this.perlengkapan1,
      this.perlengkapan2,
      this.perlengkapan3,
      this.perlengkapan4,
      this.perlengkapan5,
      this.perlengkapan6,
      this.totalPerlengkapan});

  Perlengkapan.fromJson(Map<String, dynamic> json) {
    obat = json['obat'];
    sabut = json['sabut'];
    perlengkapan1 = json['perlengkapan1'];
    perlengkapan2 = json['perlengkapan2'];
    perlengkapan3 = json['perlengkapan3'];
    perlengkapan4 = json['perlengkapan4'];
    perlengkapan5 = json['perlengkapan5'];
    perlengkapan6 = json['perlengkapan6'];
    totalPerlengkapan = json['total_perlengkapan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['obat'] = this.obat;
    data['sabut'] = this.sabut;
    data['perlengkapan1'] = this.perlengkapan1;
    data['perlengkapan2'] = this.perlengkapan2;
    data['perlengkapan3'] = this.perlengkapan3;
    data['perlengkapan4'] = this.perlengkapan4;
    data['perlengkapan5'] = this.perlengkapan5;
    data['perlengkapan6'] = this.perlengkapan6;
    data['total_perlengkapan'] = this.totalPerlengkapan;
    return data;
  }
}

class LainLain {
  String sewaLahanParkir;
  String konsumsiKaryawan;
  String laundry;
  String iuranWarga;
  String sampah;
  String lainLain1;
  String lainLain2;
  String lainLain3;
  String totalLainLain;

  LainLain(
      {this.sewaLahanParkir,
      this.konsumsiKaryawan,
      this.laundry,
      this.iuranWarga,
      this.sampah,
      this.lainLain1,
      this.lainLain2,
      this.lainLain3,
      this.totalLainLain});

  LainLain.fromJson(Map<String, dynamic> json) {
    sewaLahanParkir = json['sewa_lahan_parkir'];
    konsumsiKaryawan = json['konsumsi_karyawan'];
    laundry = json['laundry'];
    iuranWarga = json['iuran_warga'];
    sampah = json['sampah'];
    lainLain1 = json['lain_lain1'];
    lainLain2 = json['lain_lain2'];
    lainLain3 = json['lain_lain3'];
    totalLainLain = json['total_lain_lain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sewa_lahan_parkir'] = this.sewaLahanParkir;
    data['konsumsi_karyawan'] = this.konsumsiKaryawan;
    data['laundry'] = this.laundry;
    data['iuran_warga'] = this.iuranWarga;
    data['sampah'] = this.sampah;
    data['lain_lain1'] = this.lainLain1;
    data['lain_lain2'] = this.lainLain2;
    data['lain_lain3'] = this.lainLain3;
    data['total_lain_lain'] = this.totalLainLain;
    return data;
  }
}
