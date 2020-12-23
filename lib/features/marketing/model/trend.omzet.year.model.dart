class TrendOmzetYearModel {
  String id;
  String outlet;
  String regional;
  String s2TahunSebelum;
  String s2TahunSebelumPersentase;
  String s1TahunSebelum;
  String s1TahunSebelumPersentase;
  String tahunSekarang;
  String tahunSekarangPersentase;

  TrendOmzetYearModel(
      {this.id,
      this.outlet,
      this.regional,
      this.s2TahunSebelum,
      this.s2TahunSebelumPersentase,
      this.s1TahunSebelum,
      this.s1TahunSebelumPersentase,
      this.tahunSekarang,
      this.tahunSekarangPersentase});

  TrendOmzetYearModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outlet = json['outlet'];
    regional = json['regional'];
    s2TahunSebelum = json['2_tahun_sebelum'];
    s2TahunSebelumPersentase = json['2_tahun_sebelum_persentase'];
    s1TahunSebelum = json['1_tahun_sebelum'];
    s1TahunSebelumPersentase = json['1_tahun_sebelum_persentase'];
    tahunSekarang = json['tahun_sekarang'];
    tahunSekarangPersentase = json['tahun_sekarang_persentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    data['2_tahun_sebelum'] = this.s2TahunSebelum;
    data['2_tahun_sebelum_persentase'] = this.s2TahunSebelumPersentase;
    data['1_tahun_sebelum'] = this.s1TahunSebelum;
    data['1_tahun_sebelum_persentase'] = this.s1TahunSebelumPersentase;
    data['tahun_sekarang'] = this.tahunSekarang;
    data['tahun_sekarang_persentase'] = this.tahunSekarangPersentase;
    return data;
  }
}
