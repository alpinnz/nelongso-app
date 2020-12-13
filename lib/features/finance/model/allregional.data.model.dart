class AllregionalDataModel {
  String no;
  String outlet;
  String regional;
  String namaMitra;
  String bank;
  String noRek;
  String anRek;
  String pic;
  String ppn;

  AllregionalDataModel(
      {this.no,
      this.outlet,
      this.regional,
      this.namaMitra,
      this.bank,
      this.noRek,
      this.anRek,
      this.pic,
      this.ppn});

  AllregionalDataModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    outlet = json['outlet'];
    regional = json['regional'];
    namaMitra = json['nama_mitra'];
    bank = json['bank'];
    noRek = json['no_rek'];
    anRek = json['an_rek'];
    pic = json['pic'];
    ppn = json['ppn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    data['nama_mitra'] = this.namaMitra;
    data['bank'] = this.bank;
    data['no_rek'] = this.noRek;
    data['an_rek'] = this.anRek;
    data['pic'] = this.pic;
    data['ppn'] = this.ppn;
    return data;
  }
}
