class KetercapaianOmzetModel {
  String no;
  String namaOutlet;
  String regional;
  String target;
  String persentase;
  String targetOmset;
  String realitaOmset;
  String selisihOmset;
  String persentaseOmset;
  String jauhDariTargetOmset;
  String kunjunganRealita;
  String kunjunganTarget;
  String basketSizeRealita;
  String basketSizeTarget;
  String jumlahTargetSelisih;
  String nomorImei;

  KetercapaianOmzetModel(
      {this.no,
      this.namaOutlet,
      this.regional,
      this.target,
      this.persentase,
      this.targetOmset,
      this.realitaOmset,
      this.selisihOmset,
      this.persentaseOmset,
      this.jauhDariTargetOmset,
      this.kunjunganRealita,
      this.kunjunganTarget,
      this.basketSizeRealita,
      this.basketSizeTarget,
      this.jumlahTargetSelisih,
      this.nomorImei});

  KetercapaianOmzetModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    regional = json['regional'];
    target = json['target'];
    persentase = json['persentase'];
    targetOmset = json['target_omset'];
    realitaOmset = json['realita_omset'];
    selisihOmset = json['selisih_omset'];
    persentaseOmset = json['persentase_omset'];
    jauhDariTargetOmset = json['jauh_dari_target_omset'];
    kunjunganRealita = json['kunjungan_realita'];
    kunjunganTarget = json['kunjungan_target'];
    basketSizeRealita = json['basket_size_realita'];
    basketSizeTarget = json['basket_size_target'];
    jumlahTargetSelisih = json['jumlah_(target/selisih)'];
    nomorImei = json['nomor_imei'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['regional'] = this.regional;
    data['target'] = this.target;
    data['persentase'] = this.persentase;
    data['target_omset'] = this.targetOmset;
    data['realita_omset'] = this.realitaOmset;
    data['selisih_omset'] = this.selisihOmset;
    data['persentase_omset'] = this.persentaseOmset;
    data['jauh_dari_target_omset'] = this.jauhDariTargetOmset;
    data['kunjungan_realita'] = this.kunjunganRealita;
    data['kunjungan_target'] = this.kunjunganTarget;
    data['basket_size_realita'] = this.basketSizeRealita;
    data['basket_size_target'] = this.basketSizeTarget;
    data['jumlah_(target/selisih)'] = this.jumlahTargetSelisih;
    data['nomor_imei'] = this.nomorImei;
    return data;
  }
}
