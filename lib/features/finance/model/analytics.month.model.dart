class AnalyticsMonthModel {
  String no;
  String namaOutlet;
  String regional;
  String bulan;
  String hpp;
  String op;
  String opPro;
  String opNonPro;
  String bebanGaji;
  String marketing;
  String net;
  String jumlahKaryawan;
  String produktivitas;

  AnalyticsMonthModel(
      {this.no,
      this.namaOutlet,
      this.regional,
      this.bulan,
      this.hpp,
      this.op,
      this.opPro,
      this.opNonPro,
      this.bebanGaji,
      this.marketing,
      this.net,
      this.jumlahKaryawan,
      this.produktivitas});

  AnalyticsMonthModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    regional = json['regional'];
    bulan = json['bulan'];
    hpp = json['hpp'];
    op = json['op'];
    opPro = json['op_pro'];
    opNonPro = json['op_non_pro'];
    bebanGaji = json['beban_gaji'];
    marketing = json['marketing'];
    net = json['net'];
    jumlahKaryawan = json['jumlah_karyawan'];
    produktivitas = json['produktivitas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['regional'] = this.regional;
    data['bulan'] = this.bulan;
    data['hpp'] = this.hpp;
    data['op'] = this.op;
    data['op_pro'] = this.opPro;
    data['op_non_pro'] = this.opNonPro;
    data['beban_gaji'] = this.bebanGaji;
    data['marketing'] = this.marketing;
    data['net'] = this.net;
    data['jumlah_karyawan'] = this.jumlahKaryawan;
    data['produktivitas'] = this.produktivitas;
    return data;
  }
}
