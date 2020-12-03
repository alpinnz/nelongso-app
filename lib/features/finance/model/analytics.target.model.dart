class AnalyticsTargetModel {
  String outlet;
  String regional;
  String januari;
  String februari;
  String maret;
  String april;
  String mei;
  String juni;
  String juli;
  String agustus;
  String september;
  String oktober;
  String november;
  String desember;

  AnalyticsTargetModel(
      {this.outlet,
      this.regional,
      this.januari,
      this.februari,
      this.maret,
      this.april,
      this.mei,
      this.juni,
      this.juli,
      this.agustus,
      this.september,
      this.oktober,
      this.november,
      this.desember});

  AnalyticsTargetModel.fromJson(Map<String, dynamic> json) {
    outlet = json['outlet'];
    regional = json['regional'];
    januari = json['januari'];
    februari = json['februari'];
    maret = json['maret'];
    april = json['april'];
    mei = json['mei'];
    juni = json['juni'];
    juli = json['juli'];
    agustus = json['agustus'];
    september = json['september'];
    oktober = json['oktober'];
    november = json['november'];
    desember = json['desember'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['outlet'] = this.outlet;
    data['regional'] = this.regional;
    data['januari'] = this.januari;
    data['februari'] = this.februari;
    data['maret'] = this.maret;
    data['april'] = this.april;
    data['mei'] = this.mei;
    data['juni'] = this.juni;
    data['juli'] = this.juli;
    data['agustus'] = this.agustus;
    data['september'] = this.september;
    data['oktober'] = this.oktober;
    data['november'] = this.november;
    data['desember'] = this.desember;
    return data;
  }
}
