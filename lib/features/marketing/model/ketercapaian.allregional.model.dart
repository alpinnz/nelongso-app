class KetercapaianAllregionalModel {
  String no;
  String regional;
  String target;
  String realita;
  String selisih;
  String prosentase;

  KetercapaianAllregionalModel(
      {this.no,
      this.regional,
      this.target,
      this.realita,
      this.selisih,
      this.prosentase});

  KetercapaianAllregionalModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    regional = json['regional'];
    target = json['target'];
    realita = json['realita'];
    selisih = json['selisih'];
    prosentase = json['prosentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['regional'] = this.regional;
    data['target'] = this.target;
    data['realita'] = this.realita;
    data['selisih'] = this.selisih;
    data['prosentase'] = this.prosentase;
    return data;
  }
}
