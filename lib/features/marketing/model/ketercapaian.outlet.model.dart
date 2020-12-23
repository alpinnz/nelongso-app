class KetercapaianOutletModel {
  String no;
  String namaOutlet;
  String omzet1BulanSebelum;
  String omzetBulanSekarang;
  String kondisi;

  KetercapaianOutletModel(
      {this.no,
      this.namaOutlet,
      this.omzet1BulanSebelum,
      this.omzetBulanSekarang,
      this.kondisi});

  KetercapaianOutletModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    omzet1BulanSebelum = json['omzet_1_bulan_sebelum'];
    omzetBulanSekarang = json['omzet_bulan_sekarang'];
    kondisi = json['kondisi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['omzet_1_bulan_sebelum'] = this.omzet1BulanSebelum;
    data['omzet_bulan_sekarang'] = this.omzetBulanSekarang;
    data['kondisi'] = this.kondisi;
    return data;
  }
}
