class KetercapaianKunjunganModel {
  String no;
  String namaOutlet;
  String regional;
  String target;
  String persentase;
  String targetKunjungan;
  String realitaKunjungan;
  String selisihKunjungan;
  String ketercapaianKunjungan;

  KetercapaianKunjunganModel(
      {this.no,
      this.namaOutlet,
      this.regional,
      this.target,
      this.persentase,
      this.targetKunjungan,
      this.realitaKunjungan,
      this.selisihKunjungan,
      this.ketercapaianKunjungan});

  KetercapaianKunjunganModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    regional = json['regional'];
    target = json['target'];
    persentase = json['persentase'];
    targetKunjungan = json['target_kunjungan'];
    realitaKunjungan = json['realita_kunjungan'];
    selisihKunjungan = json['selisih_kunjungan'];
    ketercapaianKunjungan = json['ketercapaian_kunjungan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['regional'] = this.regional;
    data['target'] = this.target;
    data['persentase'] = this.persentase;
    data['target_kunjungan'] = this.targetKunjungan;
    data['realita_kunjungan'] = this.realitaKunjungan;
    data['selisih_kunjungan'] = this.selisihKunjungan;
    data['ketercapaian_kunjungan'] = this.ketercapaianKunjungan;
    return data;
  }
}
