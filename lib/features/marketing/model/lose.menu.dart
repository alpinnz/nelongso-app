class LoseMenuModel {
  String id;
  String menu;
  String jumlahQtyLoseSale;

  LoseMenuModel({this.id, this.menu, this.jumlahQtyLoseSale});

  LoseMenuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menu = json['menu'];
    jumlahQtyLoseSale = json['jumlah_qty_lose_sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['menu'] = this.menu;
    data['jumlah_qty_lose_sale'] = this.jumlahQtyLoseSale;
    return data;
  }
}
