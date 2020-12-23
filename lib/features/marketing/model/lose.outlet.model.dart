class LoseOutletModel {
  String id;
  String outlet;
  String jumlahLoseSale;

  LoseOutletModel({this.id, this.outlet, this.jumlahLoseSale});

  LoseOutletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outlet = json['outlet'];
    jumlahLoseSale = json['jumlah_lose_sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['outlet'] = this.outlet;
    data['jumlah_lose_sale'] = this.jumlahLoseSale;
    return data;
  }
}
