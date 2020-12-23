class AllregionalShareModel {
  String id;
  String outlet;
  ShareProfit shareProfit;
  ShareProfit bep;
  String keterangan;

  AllregionalShareModel(
      {this.id, this.outlet, this.shareProfit, this.bep, this.keterangan});

  AllregionalShareModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outlet = json['outlet'];
    shareProfit = json['share_profit'] != null
        ? new ShareProfit.fromJson(json['share_profit'])
        : null;
    bep = json['bep'] != null ? new ShareProfit.fromJson(json['bep']) : null;
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet'] = this.outlet;
    if (this.shareProfit != null) {
      data['share_profit'] = this.shareProfit.toJson();
    }
    if (this.bep != null) {
      data['bep'] = this.bep.toJson();
    }
    data['keterangan'] = this.keterangan;
    return data;
  }
}

class ShareProfit {
  String nelongso;
  String persentaseNelongso;
  String mitra;
  String persentaseMitra;

  ShareProfit(
      {this.nelongso,
      this.persentaseNelongso,
      this.mitra,
      this.persentaseMitra});

  ShareProfit.fromJson(Map<String, dynamic> json) {
    nelongso = json['nelongso'];
    persentaseNelongso = json['persentase_nelongso'];
    mitra = json['mitra'];
    persentaseMitra = json['persentase_mitra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nelongso'] = this.nelongso;
    data['persentase_nelongso'] = this.persentaseNelongso;
    data['mitra'] = this.mitra;
    data['persentase_mitra'] = this.persentaseMitra;
    return data;
  }
}
