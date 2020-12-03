class OutletModel {
  String keterangan;
  String outlet;
  String brand;
  String regional;
  String status;
  String jenis;
  String aplikasi;
  String biayaLainnya;
  String shareProfitNelongso;
  String shareProfitMitra;
  String statusBep;
  String bepNelongso;
  String bepMitra;
  String ppn;

  OutletModel(
      {this.keterangan,
      this.outlet,
      this.brand,
      this.regional,
      this.status,
      this.jenis,
      this.aplikasi,
      this.biayaLainnya,
      this.shareProfitNelongso,
      this.shareProfitMitra,
      this.statusBep,
      this.bepNelongso,
      this.bepMitra,
      this.ppn});

  OutletModel.fromJson(Map<String, dynamic> json) {
    keterangan = json['keterangan'];
    outlet = json['outlet'];
    brand = json['brand'];
    regional = json['regional'];
    status = json['status'];
    jenis = json['jenis'];
    aplikasi = json['aplikasi'];
    biayaLainnya = json['biaya_lainnya'];
    shareProfitNelongso = json['share_profit_nelongso'];
    shareProfitMitra = json['share_profit_mitra'];
    statusBep = json['status_bep'];
    bepNelongso = json['bep_nelongso'];
    bepMitra = json['bep_mitra'];
    ppn = json['ppn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keterangan'] = this.keterangan;
    data['outlet'] = this.outlet;
    data['brand'] = this.brand;
    data['regional'] = this.regional;
    data['status'] = this.status;
    data['jenis'] = this.jenis;
    data['aplikasi'] = this.aplikasi;
    data['biaya_lainnya'] = this.biayaLainnya;
    data['share_profit_nelongso'] = this.shareProfitNelongso;
    data['share_profit_mitra'] = this.shareProfitMitra;
    data['status_bep'] = this.statusBep;
    data['bep_nelongso'] = this.bepNelongso;
    data['bep_mitra'] = this.bepMitra;
    data['ppn'] = this.ppn;
    return data;
  }
}
