class AllregionalPphModel {
  String no;
  String outlet;
  BulanSebelum bulanSebelum;
  BulanSebelum bulanSekarang;

  AllregionalPphModel(
      {this.no, this.outlet, this.bulanSebelum, this.bulanSekarang});

  AllregionalPphModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    outlet = json['outlet'];
    bulanSebelum = json['bulan_sebelum'] != null
        ? new BulanSebelum.fromJson(json['bulan_sebelum'])
        : null;
    bulanSekarang = json['bulan_sekarang'] != null
        ? new BulanSebelum.fromJson(json['bulan_sekarang'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['outlet'] = this.outlet;
    if (this.bulanSebelum != null) {
      data['bulan_sebelum'] = this.bulanSebelum.toJson();
    }
    if (this.bulanSekarang != null) {
      data['bulan_sekarang'] = this.bulanSekarang.toJson();
    }
    return data;
  }
}

class BulanSebelum {
  String netProfit;
  String persentase;
  String pph;

  BulanSebelum({this.netProfit, this.persentase, this.pph});

  BulanSebelum.fromJson(Map<String, dynamic> json) {
    netProfit = json['net_profit'];
    persentase = json['persentase'];
    pph = json['pph'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['net_profit'] = this.netProfit;
    data['persentase'] = this.persentase;
    data['pph'] = this.pph;
    return data;
  }
}
