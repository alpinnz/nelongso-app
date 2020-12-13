class AllregionalShareModel {
  String no;
  String outlet;
  String regional;
  Omzet omzet;
  HargaPokokPenjualan hargaPokokPenjualan;
  TotalOperasionalProduksi totalOperasionalProduksi;
  OperasionalNonProduksi operasionalNonProduksi;
  String promoMarketing;
  String grossProfit;
  BebanGaji bebanGaji;
  NetProfit netProfit;
  String pic;

  AllregionalShareModel(
      {this.no,
      this.outlet,
      this.regional,
      this.omzet,
      this.hargaPokokPenjualan,
      this.totalOperasionalProduksi,
      this.operasionalNonProduksi,
      this.promoMarketing,
      this.grossProfit,
      this.bebanGaji,
      this.netProfit,
      this.pic});

  AllregionalShareModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    outlet = json['outlet'];
    regional = json['regional'];
    omzet = json['omzet'] != null ? new Omzet.fromJson(json['omzet']) : null;
    hargaPokokPenjualan = json['harga_pokok_penjualan'] != null
        ? new HargaPokokPenjualan.fromJson(json['harga_pokok_penjualan'])
        : null;
    totalOperasionalProduksi = json['total_operasional_produksi'] != null
        ? new TotalOperasionalProduksi.fromJson(
            json['total_operasional_produksi'])
        : null;
    operasionalNonProduksi = json['operasional_non_produksi'] != null
        ? new OperasionalNonProduksi.fromJson(json['operasional_non_produksi'])
        : null;
    promoMarketing = json['promo_marketing'];
    grossProfit = json['gross_profit'];
    bebanGaji = json['beban_gaji'] != null
        ? new BebanGaji.fromJson(json['beban_gaji'])
        : null;
    netProfit = json['net_profit'] != null
        ? new NetProfit.fromJson(json['net_profit'])
        : null;
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    if (this.omzet != null) {
      data['omzet'] = this.omzet.toJson();
    }
    if (this.hargaPokokPenjualan != null) {
      data['harga_pokok_penjualan'] = this.hargaPokokPenjualan.toJson();
    }
    if (this.totalOperasionalProduksi != null) {
      data['total_operasional_produksi'] =
          this.totalOperasionalProduksi.toJson();
    }
    if (this.operasionalNonProduksi != null) {
      data['operasional_non_produksi'] = this.operasionalNonProduksi.toJson();
    }
    data['promo_marketing'] = this.promoMarketing;
    data['gross_profit'] = this.grossProfit;
    if (this.bebanGaji != null) {
      data['beban_gaji'] = this.bebanGaji.toJson();
    }
    if (this.netProfit != null) {
      data['net_profit'] = this.netProfit.toJson();
    }
    data['pic'] = this.pic;
    return data;
  }
}

class Omzet {
  String penjualan;
  String ppn;
  String gojek;
  String grab;
  String omset;
  String target;
  String persentase;

  Omzet(
      {this.penjualan,
      this.ppn,
      this.gojek,
      this.grab,
      this.omset,
      this.target,
      this.persentase});

  Omzet.fromJson(Map<String, dynamic> json) {
    penjualan = json['penjualan'];
    ppn = json['ppn'];
    gojek = json['gojek'];
    grab = json['grab'];
    omset = json['omset'];
    target = json['target'];
    persentase = json['persentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['penjualan'] = this.penjualan;
    data['ppn'] = this.ppn;
    data['gojek'] = this.gojek;
    data['grab'] = this.grab;
    data['omset'] = this.omset;
    data['target'] = this.target;
    data['persentase'] = this.persentase;
    return data;
  }
}

class HargaPokokPenjualan {
  String hargaPokokPenjualan;
  String hpp;
  String targetHpp;
  String pencapaianHpp;

  HargaPokokPenjualan(
      {this.hargaPokokPenjualan, this.hpp, this.targetHpp, this.pencapaianHpp});

  HargaPokokPenjualan.fromJson(Map<String, dynamic> json) {
    hargaPokokPenjualan = json['harga_pokok_penjualan'];
    hpp = json['hpp'];
    targetHpp = json['target_hpp'];
    pencapaianHpp = json['pencapaian_hpp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['harga_pokok_penjualan'] = this.hargaPokokPenjualan;
    data['hpp'] = this.hpp;
    data['target_hpp'] = this.targetHpp;
    data['pencapaian_hpp'] = this.pencapaianHpp;
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
  String totalOperasionalProduksi;
  String persentaseOperasionalProduksi;
  String targetOperasionalProduksi;
  String pecapaianOperasionalProduksi;

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
      this.biayaLainLain,
      this.totalOperasionalProduksi,
      this.persentaseOperasionalProduksi,
      this.targetOperasionalProduksi,
      this.pecapaianOperasionalProduksi});

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
    totalOperasionalProduksi = json['total_operasional_produksi'];
    persentaseOperasionalProduksi = json['persentase_operasional_produksi'];
    targetOperasionalProduksi = json['target_operasional_produksi'];
    pecapaianOperasionalProduksi = json['pecapaian_operasional_produksi'];
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
    data['total_operasional_produksi'] = this.totalOperasionalProduksi;
    data['persentase_operasional_produksi'] =
        this.persentaseOperasionalProduksi;
    data['target_operasional_produksi'] = this.targetOperasionalProduksi;
    data['pecapaian_operasional_produksi'] = this.pecapaianOperasionalProduksi;
    return data;
  }
}

class OperasionalNonProduksi {
  String pph;
  String sedekah;
  String bpjs;
  String perawatanProgram;
  String beklame;
  String reward;
  String pbb;
  String adminBank;
  String totalOperasionalNonProduksi;
  String persentaseOperasionalNonProduksi;
  String targetOperasionalNonProduksi;
  String pecapaianOperasionalNonProduksi;

  OperasionalNonProduksi(
      {this.pph,
      this.sedekah,
      this.bpjs,
      this.perawatanProgram,
      this.beklame,
      this.reward,
      this.pbb,
      this.adminBank,
      this.totalOperasionalNonProduksi,
      this.persentaseOperasionalNonProduksi,
      this.targetOperasionalNonProduksi,
      this.pecapaianOperasionalNonProduksi});

  OperasionalNonProduksi.fromJson(Map<String, dynamic> json) {
    pph = json['pph'];
    sedekah = json['sedekah'];
    bpjs = json['bpjs'];
    perawatanProgram = json['perawatan_program'];
    beklame = json['beklame'];
    reward = json['reward'];
    pbb = json['pbb'];
    adminBank = json['admin_bank'];
    totalOperasionalNonProduksi = json['total_operasional_non_produksi'];
    persentaseOperasionalNonProduksi =
        json['persentase_operasional_non_produksi'];
    targetOperasionalNonProduksi = json['target_operasional_non_produksi'];
    pecapaianOperasionalNonProduksi =
        json['pecapaian_operasional_non_produksi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pph'] = this.pph;
    data['sedekah'] = this.sedekah;
    data['bpjs'] = this.bpjs;
    data['perawatan_program'] = this.perawatanProgram;
    data['beklame'] = this.beklame;
    data['reward'] = this.reward;
    data['pbb'] = this.pbb;
    data['admin_bank'] = this.adminBank;
    data['total_operasional_non_produksi'] = this.totalOperasionalNonProduksi;
    data['persentase_operasional_non_produksi'] =
        this.persentaseOperasionalNonProduksi;
    data['target_operasional_non_produksi'] = this.targetOperasionalNonProduksi;
    data['pecapaian_operasional_non_produksi'] =
        this.pecapaianOperasionalNonProduksi;
    return data;
  }
}

class BebanGaji {
  String bebanGaji;
  String gaji;
  String targetGaji;
  String pecapaianGaji;

  BebanGaji({this.bebanGaji, this.gaji, this.targetGaji, this.pecapaianGaji});

  BebanGaji.fromJson(Map<String, dynamic> json) {
    bebanGaji = json['beban_gaji'];
    gaji = json['gaji'];
    targetGaji = json['target_gaji'];
    pecapaianGaji = json['pecapaian_gaji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beban_gaji'] = this.bebanGaji;
    data['gaji'] = this.gaji;
    data['target_gaji'] = this.targetGaji;
    data['pecapaian_gaji'] = this.pecapaianGaji;
    return data;
  }
}

class NetProfit {
  String netProfit;
  String persentaseNetProfit;
  String targetNetProfit;
  String pencapaianNetProfit;

  NetProfit(
      {this.netProfit,
      this.persentaseNetProfit,
      this.targetNetProfit,
      this.pencapaianNetProfit});

  NetProfit.fromJson(Map<String, dynamic> json) {
    netProfit = json['net_profit'];
    persentaseNetProfit = json['persentase_net_profit'];
    targetNetProfit = json['target_net_profit'];
    pencapaianNetProfit = json['pencapaian_net_profit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['net_profit'] = this.netProfit;
    data['persentase_net_profit'] = this.persentaseNetProfit;
    data['target_net_profit'] = this.targetNetProfit;
    data['pencapaian_net_profit'] = this.pencapaianNetProfit;
    return data;
  }
}
