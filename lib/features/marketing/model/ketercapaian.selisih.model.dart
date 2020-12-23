class KetercapaianSelisihModel {
  String no;
  String namaOutlet;
  String bulanSebelum;
  String bulanSekarang;
  String selisih;

  KetercapaianSelisihModel(
      {this.no,
      this.namaOutlet,
      this.bulanSebelum,
      this.bulanSekarang,
      this.selisih});

  KetercapaianSelisihModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    bulanSebelum = json['bulan_sebelum'];
    bulanSekarang = json['bulan_sekarang'];
    selisih = json['selisih'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['bulan_sebelum'] = this.bulanSebelum;
    data['bulan_sekarang'] = this.bulanSekarang;
    data['selisih'] = this.selisih;
    return data;
  }
}
