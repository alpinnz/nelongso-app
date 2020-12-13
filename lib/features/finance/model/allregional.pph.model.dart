class AllregionalPphModel {
  String name;
  String message;
  int code;
  int status;
  List<Data> data;

  AllregionalPphModel(
      {this.name, this.message, this.code, this.status, this.data});

  AllregionalPphModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String no;
  String outlet;
  BulanSebelum bulanSebelum;
  BulanSebelum bulanSekarang;

  Data({this.no, this.outlet, this.bulanSebelum, this.bulanSekarang});

  Data.fromJson(Map<String, dynamic> json) {
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
