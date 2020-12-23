class KetercapaianBasketModel {
  String no;
  String namaOutlet;
  String regional;
  String target;
  String persentase;
  String targetBasketSize;
  String realitaBasketSize;
  String selisihBasketSize;
  String ketercapaianBasketSize;

  KetercapaianBasketModel(
      {this.no,
      this.namaOutlet,
      this.regional,
      this.target,
      this.persentase,
      this.targetBasketSize,
      this.realitaBasketSize,
      this.selisihBasketSize,
      this.ketercapaianBasketSize});

  KetercapaianBasketModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    regional = json['regional'];
    target = json['target'];
    persentase = json['persentase'];
    targetBasketSize = json['target_basket_size'];
    realitaBasketSize = json['realita_basket_size'];
    selisihBasketSize = json['selisih_basket_size'];
    ketercapaianBasketSize = json['ketercapaian_basket_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['regional'] = this.regional;
    data['target'] = this.target;
    data['persentase'] = this.persentase;
    data['target_basket_size'] = this.targetBasketSize;
    data['realita_basket_size'] = this.realitaBasketSize;
    data['selisih_basket_size'] = this.selisihBasketSize;
    data['ketercapaian_basket_size'] = this.ketercapaianBasketSize;
    return data;
  }
}
