class AllregionalFinalModel {
  String no;
  String outlet;
  String regional;
  Omzet omzet;
  HargaPokokPenjualan hargaPokokPenjualan;
  Marketing marketing;
  BebanGaji bebanGaji;
  TotalOperasionalProduksi totalOperasionalProduksi;
  TotalOperasionalNonProduksi totalOperasionalNonProduksi;
  NetProfit netProfit;
  ShareProfit shareProfit;

  AllregionalFinalModel(
      {this.no,
      this.outlet,
      this.regional,
      this.omzet,
      this.hargaPokokPenjualan,
      this.marketing,
      this.bebanGaji,
      this.totalOperasionalProduksi,
      this.totalOperasionalNonProduksi,
      this.netProfit,
      this.shareProfit});

  AllregionalFinalModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    outlet = json['outlet'];
    regional = json['regional'];
    omzet = json['omzet'] != null ? new Omzet.fromJson(json['omzet']) : null;
    hargaPokokPenjualan = json['harga_pokok_penjualan'] != null
        ? new HargaPokokPenjualan.fromJson(json['harga_pokok_penjualan'])
        : null;
    marketing = json['marketing'] != null
        ? new Marketing.fromJson(json['marketing'])
        : null;
    bebanGaji = json['beban_gaji'] != null
        ? new BebanGaji.fromJson(json['beban_gaji'])
        : null;
    totalOperasionalProduksi = json['total_operasional_produksi'] != null
        ? new TotalOperasionalProduksi.fromJson(
            json['total_operasional_produksi'])
        : null;
    totalOperasionalNonProduksi = json['total_operasional_non_produksi'] != null
        ? new TotalOperasionalNonProduksi.fromJson(
            json['total_operasional_non_produksi'])
        : null;
    netProfit = json['net_profit'] != null
        ? new NetProfit.fromJson(json['net_profit'])
        : null;
    shareProfit = json['share_profit'] != null
        ? new ShareProfit.fromJson(json['share_profit'])
        : null;
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
    if (this.marketing != null) {
      data['marketing'] = this.marketing.toJson();
    }
    if (this.bebanGaji != null) {
      data['beban_gaji'] = this.bebanGaji.toJson();
    }
    if (this.totalOperasionalProduksi != null) {
      data['total_operasional_produksi'] =
          this.totalOperasionalProduksi.toJson();
    }
    if (this.totalOperasionalNonProduksi != null) {
      data['total_operasional_non_produksi'] =
          this.totalOperasionalNonProduksi.toJson();
    }
    if (this.netProfit != null) {
      data['net_profit'] = this.netProfit.toJson();
    }
    if (this.shareProfit != null) {
      data['share_profit'] = this.shareProfit.toJson();
    }
    return data;
  }
}

class Omzet {
  String penjualan;
  String ppn;
  String gojek;
  String grab;
  String omset;
  String targe;
  String persentase;

  Omzet(
      {this.penjualan,
      this.ppn,
      this.gojek,
      this.grab,
      this.omset,
      this.targe,
      this.persentase});

  Omzet.fromJson(Map<String, dynamic> json) {
    penjualan = json['penjualan'];
    ppn = json['ppn'];
    gojek = json['gojek'];
    grab = json['grab'];
    omset = json['omset'];
    targe = json['targe'];
    persentase = json['persentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['penjualan'] = this.penjualan;
    data['ppn'] = this.ppn;
    data['gojek'] = this.gojek;
    data['grab'] = this.grab;
    data['omset'] = this.omset;
    data['targe'] = this.targe;
    data['persentase'] = this.persentase;
    return data;
  }
}

class HargaPokokPenjualan {
  String hargaPokokPenjualan;
  String persentaseHpp;
  String targetHpp;
  String pencapaianHpp;

  HargaPokokPenjualan(
      {this.hargaPokokPenjualan,
      this.persentaseHpp,
      this.targetHpp,
      this.pencapaianHpp});

  HargaPokokPenjualan.fromJson(Map<String, dynamic> json) {
    hargaPokokPenjualan = json['harga_pokok_penjualan'];
    persentaseHpp = json['persentase_hpp'];
    targetHpp = json['target_hpp'];
    pencapaianHpp = json['pencapaian_hpp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['harga_pokok_penjualan'] = this.hargaPokokPenjualan;
    data['persentase_hpp'] = this.persentaseHpp;
    data['target_hpp'] = this.targetHpp;
    data['pencapaian_hpp'] = this.pencapaianHpp;
    return data;
  }
}

class Marketing {
  String bebanPemasaranAndIklan;
  String persentaseMarketing;
  String targetMarketing;
  String pencapaianMarketing;

  Marketing(
      {this.bebanPemasaranAndIklan,
      this.persentaseMarketing,
      this.targetMarketing,
      this.pencapaianMarketing});

  Marketing.fromJson(Map<String, dynamic> json) {
    bebanPemasaranAndIklan = json['beban_pemasaran_and_iklan'];
    persentaseMarketing = json['persentase_marketing'];
    targetMarketing = json['target_marketing'];
    pencapaianMarketing = json['pencapaian_marketing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beban_pemasaran_and_iklan'] = this.bebanPemasaranAndIklan;
    data['persentase_marketing'] = this.persentaseMarketing;
    data['target_marketing'] = this.targetMarketing;
    data['pencapaian_marketing'] = this.pencapaianMarketing;
    return data;
  }
}

class BebanGaji {
  String bebanGaji;
  String persentaseGaji;
  String targetGaji;
  String pencapaianGaji;

  BebanGaji(
      {this.bebanGaji,
      this.persentaseGaji,
      this.targetGaji,
      this.pencapaianGaji});

  BebanGaji.fromJson(Map<String, dynamic> json) {
    bebanGaji = json['beban_gaji'];
    persentaseGaji = json['persentase_gaji'];
    targetGaji = json['target_gaji'];
    pencapaianGaji = json['pencapaian_gaji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beban_gaji'] = this.bebanGaji;
    data['persentase_gaji'] = this.persentaseGaji;
    data['target_gaji'] = this.targetGaji;
    data['pencapaian_gaji'] = this.pencapaianGaji;
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
  String lainLain;
  String totalOperasionalProduksi;
  String persentaseOperasionalProduksi;
  String targetOperasionalProduksi;
  String pencapaianOperasional;

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
      this.lainLain,
      this.totalOperasionalProduksi,
      this.persentaseOperasionalProduksi,
      this.targetOperasionalProduksi,
      this.pencapaianOperasional});

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
    lainLain = json['lain_lain'];
    totalOperasionalProduksi = json['total_operasional_produksi'];
    persentaseOperasionalProduksi = json['persentase_operasional_produksi'];
    targetOperasionalProduksi = json['target_operasional_produksi'];
    pencapaianOperasional = json['pencapaian_operasional'];
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
    data['lain_lain'] = this.lainLain;
    data['total_operasional_produksi'] = this.totalOperasionalProduksi;
    data['persentase_operasional_produksi'] =
        this.persentaseOperasionalProduksi;
    data['target_operasional_produksi'] = this.targetOperasionalProduksi;
    data['pencapaian_operasional'] = this.pencapaianOperasional;
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
  String totalOperasionalNonProduksi;
  String persentaseOperasionalNonProduksi;
  String targetOperasionalNonProduksi;
  String pencapaianNonOperasional;

  TotalOperasionalNonProduksi(
      {this.pph,
      this.sedekah,
      this.bpjs,
      this.perawatanProgram,
      this.reklame,
      this.reward,
      this.pbb,
      this.adminBank,
      this.lainLain,
      this.totalOperasionalNonProduksi,
      this.persentaseOperasionalNonProduksi,
      this.targetOperasionalNonProduksi,
      this.pencapaianNonOperasional});

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
    totalOperasionalNonProduksi = json['total_operasional_non_produksi'];
    persentaseOperasionalNonProduksi =
        json['persentase_operasional_non_produksi'];
    targetOperasionalNonProduksi = json['target_operasional_non_produksi'];
    pencapaianNonOperasional = json['pencapaian_non_operasional'];
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
    data['total_operasional_non_produksi'] = this.totalOperasionalNonProduksi;
    data['persentase_operasional_non_produksi'] =
        this.persentaseOperasionalNonProduksi;
    data['target_operasional_non_produksi'] = this.targetOperasionalNonProduksi;
    data['pencapaian_non_operasional'] = this.pencapaianNonOperasional;
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

class ShareProfit {
  String nelongso;
  String mitra;

  ShareProfit({this.nelongso, this.mitra});

  ShareProfit.fromJson(Map<String, dynamic> json) {
    nelongso = json['nelongso'];
    mitra = json['mitra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nelongso'] = this.nelongso;
    data['mitra'] = this.mitra;
    return data;
  }
}
