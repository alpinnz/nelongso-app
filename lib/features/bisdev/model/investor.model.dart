class InvestorModel {
  String namaMitra;
  String nik;
  String npwp;
  String alamatMitra;
  String noRekening;
  String anRekening;
  String bank;
  List<Outlets> outlets;

  InvestorModel(
      {this.namaMitra,
      this.nik,
      this.npwp,
      this.alamatMitra,
      this.noRekening,
      this.anRekening,
      this.bank,
      this.outlets});

  InvestorModel.fromJson(Map<String, dynamic> json) {
    namaMitra = json['nama_mitra'];
    nik = json['nik'];
    npwp = json['npwp'];
    alamatMitra = json['alamat_mitra'];
    noRekening = json['no_rekening'];
    anRekening = json['an_rekening_'];
    bank = json['bank'];
    if (json['outlets'] != null) {
      outlets = new List<Outlets>();
      json['outlets'].forEach((v) {
        outlets.add(new Outlets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_mitra'] = this.namaMitra;
    data['nik'] = this.nik;
    data['npwp'] = this.npwp;
    data['alamat_mitra'] = this.alamatMitra;
    data['no_rekening'] = this.noRekening;
    data['an_rekening_'] = this.anRekening;
    data['bank'] = this.bank;
    if (this.outlets != null) {
      data['outlets'] = this.outlets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Outlets {
  String keterangan;
  String namaOutlet;
  String brand;
  String regional;
  String status;
  String jenis;
  String aplikasi;
  String harga;
  String alamat;
  String namaManager;
  String namaMitra;
  String tanggalGrandOpening;
  String tanggalTerakhirBayar;
  String tanggalJatuhTempo;
  String recheck;
  String rabTotal;
  String hargaSewaRukoPerTahun;
  String biayaLainnya;
  String shareProfitNelongso;
  String shareProfitMitra;
  String statusBep;
  String bepNelongso;
  String bepMitra;
  String ppn;

  Outlets(
      {this.keterangan,
      this.namaOutlet,
      this.brand,
      this.regional,
      this.status,
      this.jenis,
      this.aplikasi,
      this.harga,
      this.alamat,
      this.namaManager,
      this.namaMitra,
      this.tanggalGrandOpening,
      this.tanggalTerakhirBayar,
      this.tanggalJatuhTempo,
      this.recheck,
      this.rabTotal,
      this.hargaSewaRukoPerTahun,
      this.biayaLainnya,
      this.shareProfitNelongso,
      this.shareProfitMitra,
      this.statusBep,
      this.bepNelongso,
      this.bepMitra,
      this.ppn});

  Outlets.fromJson(Map<String, dynamic> json) {
    keterangan = json['keterangan'];
    namaOutlet = json['nama_outlet'];
    brand = json['brand'];
    regional = json['regional'];
    status = json['status'];
    jenis = json['jenis'];
    aplikasi = json['aplikasi'];
    harga = json['harga'];
    alamat = json['alamat'];
    namaManager = json['nama_manager'];
    namaMitra = json['nama_mitra'];
    tanggalGrandOpening = json['tanggal_grand_opening'];
    tanggalTerakhirBayar = json['tanggal_terakhir_bayar'];
    tanggalJatuhTempo = json['tanggal_jatuh_tempo'];
    recheck = json['recheck'];
    rabTotal = json['rab_total'];
    hargaSewaRukoPerTahun = json['harga_sewa_ruko_per_tahun'];
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
    data['nama_outlet'] = this.namaOutlet;
    data['brand'] = this.brand;
    data['regional'] = this.regional;
    data['status'] = this.status;
    data['jenis'] = this.jenis;
    data['aplikasi'] = this.aplikasi;
    data['harga'] = this.harga;
    data['alamat'] = this.alamat;
    data['nama_manager'] = this.namaManager;
    data['nama_mitra'] = this.namaMitra;
    data['tanggal_grand_opening'] = this.tanggalGrandOpening;
    data['tanggal_terakhir_bayar'] = this.tanggalTerakhirBayar;
    data['tanggal_jatuh_tempo'] = this.tanggalJatuhTempo;
    data['recheck'] = this.recheck;
    data['rab_total'] = this.rabTotal;
    data['harga_sewa_ruko_per_tahun'] = this.hargaSewaRukoPerTahun;
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
