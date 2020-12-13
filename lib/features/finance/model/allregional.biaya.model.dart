class AllregionalBiayaModel {
  String no;
  String outlet;
  String regional;
  TotalOperasionalProduksi totalOperasionalProduksi;
  TotalOperasionalNonProduksi totalOperasionalNonProduksi;

  AllregionalBiayaModel(
      {this.no,
      this.outlet,
      this.regional,
      this.totalOperasionalProduksi,
      this.totalOperasionalNonProduksi});

  AllregionalBiayaModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    outlet = json['outlet'];
    regional = json['regional'];
    totalOperasionalProduksi = json['total_operasional_produksi'] != null
        ? new TotalOperasionalProduksi.fromJson(
            json['total_operasional_produksi'])
        : null;
    totalOperasionalNonProduksi = json['total_operasional_non_produksi'] != null
        ? new TotalOperasionalNonProduksi.fromJson(
            json['total_operasional_non_produksi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    if (this.totalOperasionalProduksi != null) {
      data['total_operasional_produksi'] =
          this.totalOperasionalProduksi.toJson();
    }
    if (this.totalOperasionalNonProduksi != null) {
      data['total_operasional_non_produksi'] =
          this.totalOperasionalNonProduksi.toJson();
    }
    return data;
  }
}

class TotalOperasionalProduksi {
  String bensin;
  String listrik;
  String pdam;
  String wifi;
  String sedotanLimbah;
  String sewaMess;
  String atk;
  String peralatan;
  String perlengkapan;
  String pemeliharaanKendaraanAndPeralatan;
  String sewaLahanParkir;
  String konsumsiKaryawan;
  String laundry;
  String iuranWarga;
  String sampah;
  String sewaRuko;
  String rnd;
  String perbaikanOutlet;
  String biayaLainLain;

  TotalOperasionalProduksi(
      {this.bensin,
      this.listrik,
      this.pdam,
      this.wifi,
      this.sedotanLimbah,
      this.sewaMess,
      this.atk,
      this.peralatan,
      this.perlengkapan,
      this.pemeliharaanKendaraanAndPeralatan,
      this.sewaLahanParkir,
      this.konsumsiKaryawan,
      this.laundry,
      this.iuranWarga,
      this.sampah,
      this.sewaRuko,
      this.rnd,
      this.perbaikanOutlet,
      this.biayaLainLain});

  TotalOperasionalProduksi.fromJson(Map<String, dynamic> json) {
    bensin = json['bensin'];
    listrik = json['listrik'];
    pdam = json['pdam'];
    wifi = json['wifi'];
    sedotanLimbah = json['sedotan_limbah'];
    sewaMess = json['sewa_mess'];
    atk = json['atk'];
    peralatan = json['peralatan'];
    perlengkapan = json['perlengkapan'];
    pemeliharaanKendaraanAndPeralatan =
        json['pemeliharaan_kendaraan_and_peralatan'];
    sewaLahanParkir = json['sewa_lahan_parkir'];
    konsumsiKaryawan = json['konsumsi_karyawan'];
    laundry = json['laundry'];
    iuranWarga = json['iuran_warga'];
    sampah = json['sampah'];
    sewaRuko = json['sewa_ruko'];
    rnd = json['rnd'];
    perbaikanOutlet = json['perbaikan_outlet'];
    biayaLainLain = json['biaya_lain_lain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bensin'] = this.bensin;
    data['listrik'] = this.listrik;
    data['pdam'] = this.pdam;
    data['wifi'] = this.wifi;
    data['sedotan_limbah'] = this.sedotanLimbah;
    data['sewa_mess'] = this.sewaMess;
    data['atk'] = this.atk;
    data['peralatan'] = this.peralatan;
    data['perlengkapan'] = this.perlengkapan;
    data['pemeliharaan_kendaraan_and_peralatan'] =
        this.pemeliharaanKendaraanAndPeralatan;
    data['sewa_lahan_parkir'] = this.sewaLahanParkir;
    data['konsumsi_karyawan'] = this.konsumsiKaryawan;
    data['laundry'] = this.laundry;
    data['iuran_warga'] = this.iuranWarga;
    data['sampah'] = this.sampah;
    data['sewa_ruko'] = this.sewaRuko;
    data['rnd'] = this.rnd;
    data['perbaikan_outlet'] = this.perbaikanOutlet;
    data['biaya_lain_lain'] = this.biayaLainLain;
    return data;
  }
}

class TotalOperasionalNonProduksi {
  String pph;
  String sedekah;
  String bpjs;
  String perawatanProgram;
  String reklame;
  String reward;
  String pbb;
  String adminBank;
  String lainLain;

  TotalOperasionalNonProduksi(
      {this.pph,
      this.sedekah,
      this.bpjs,
      this.perawatanProgram,
      this.reklame,
      this.reward,
      this.pbb,
      this.adminBank,
      this.lainLain});

  TotalOperasionalNonProduksi.fromJson(Map<String, dynamic> json) {
    pph = json['pph'];
    sedekah = json['sedekah'];
    bpjs = json['bpjs'];
    perawatanProgram = json['perawatan_program'];
    reklame = json['reklame'];
    reward = json['reward'];
    pbb = json['pbb'];
    adminBank = json['admin_bank'];
    lainLain = json['lain_lain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pph'] = this.pph;
    data['sedekah'] = this.sedekah;
    data['bpjs'] = this.bpjs;
    data['perawatan_program'] = this.perawatanProgram;
    data['reklame'] = this.reklame;
    data['reward'] = this.reward;
    data['pbb'] = this.pbb;
    data['admin_bank'] = this.adminBank;
    data['lain_lain'] = this.lainLain;
    return data;
  }
}
