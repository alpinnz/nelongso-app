class KetercapaianRegionalModel {
  String no;
  String namaOutlet;
  String target;
  String realita;
  String selisih;
  String prosentase;

  KetercapaianRegionalModel(
      {this.no,
      this.namaOutlet,
      this.target,
      this.realita,
      this.selisih,
      this.prosentase});

  KetercapaianRegionalModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    namaOutlet = json['nama_outlet'];
    target = json['target'];
    realita = json['realita'];
    selisih = json['selisih'];
    prosentase = json['prosentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['nama_outlet'] = this.namaOutlet;
    data['target'] = this.target;
    data['realita'] = this.realita;
    data['selisih'] = this.selisih;
    data['prosentase'] = this.prosentase;
    return data;
  }
}
