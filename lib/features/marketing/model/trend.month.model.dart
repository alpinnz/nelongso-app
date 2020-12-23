class TrendMonthModel {
  String id;
  String outlet;
  String regional;
  String bulanSekarang2TahunSebelum;
  String bulanSekarang2TahunSebelumPersentase;
  String bulanSekarang1TahunSebelum;
  String bulanSekarang1TahunSebelumPersentase;
  String bulanSekarangTahunSekarang;
  String bulanSekarangTahunSekarangPersentase;

  TrendMonthModel(
      {this.id,
      this.outlet,
      this.regional,
      this.bulanSekarang2TahunSebelum,
      this.bulanSekarang2TahunSebelumPersentase,
      this.bulanSekarang1TahunSebelum,
      this.bulanSekarang1TahunSebelumPersentase,
      this.bulanSekarangTahunSekarang,
      this.bulanSekarangTahunSekarangPersentase});

  TrendMonthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outlet = json['outlet'];
    regional = json['regional'];
    bulanSekarang2TahunSebelum = json['bulan_sekarang_2_tahun_sebelum'];
    bulanSekarang2TahunSebelumPersentase =
        json['bulan_sekarang_2_tahun_sebelum_persentase'];
    bulanSekarang1TahunSebelum = json['bulan_sekarang_1_tahun_sebelum'];
    bulanSekarang1TahunSebelumPersentase =
        json['bulan_sekarang_1_tahun_sebelum_persentase'];
    bulanSekarangTahunSekarang = json['bulan_sekarang_tahun_sekarang'];
    bulanSekarangTahunSekarangPersentase =
        json['bulan_sekarang_tahun_sekarang_persentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    data['bulan_sekarang_2_tahun_sebelum'] = this.bulanSekarang2TahunSebelum;
    data['bulan_sekarang_2_tahun_sebelum_persentase'] =
        this.bulanSekarang2TahunSebelumPersentase;
    data['bulan_sekarang_1_tahun_sebelum'] = this.bulanSekarang1TahunSebelum;
    data['bulan_sekarang_1_tahun_sebelum_persentase'] =
        this.bulanSekarang1TahunSebelumPersentase;
    data['bulan_sekarang_tahun_sekarang'] = this.bulanSekarangTahunSekarang;
    data['bulan_sekarang_tahun_sekarang_persentase'] =
        this.bulanSekarangTahunSekarangPersentase;
    return data;
  }
}
