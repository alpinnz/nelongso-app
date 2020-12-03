class NoncashSaldogorestoModel {
  String id;
  SaldoBulanKemarin saldoBulanKemarin;
  SaldoBulanKemarin goRestoAll;
  SaldoBulanKemarin transferPihak;
  SaldoBulanKemarin sisaSaldo;

  NoncashSaldogorestoModel(
      {this.id,
      this.saldoBulanKemarin,
      this.goRestoAll,
      this.transferPihak,
      this.sisaSaldo});

  NoncashSaldogorestoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saldoBulanKemarin = json['saldo_bulan_kemarin'] != null
        ? new SaldoBulanKemarin.fromJson(json['saldo_bulan_kemarin'])
        : null;
    goRestoAll = json['go_resto_all'] != null
        ? new SaldoBulanKemarin.fromJson(json['go_resto_all'])
        : null;
    transferPihak = json['transfer_pihak'] != null
        ? new SaldoBulanKemarin.fromJson(json['transfer_pihak'])
        : null;
    sisaSaldo = json['sisa_saldo'] != null
        ? new SaldoBulanKemarin.fromJson(json['sisa_saldo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.saldoBulanKemarin != null) {
      data['saldo_bulan_kemarin'] = this.saldoBulanKemarin.toJson();
    }
    if (this.goRestoAll != null) {
      data['go_resto_all'] = this.goRestoAll.toJson();
    }
    if (this.transferPihak != null) {
      data['transfer_pihak'] = this.transferPihak.toJson();
    }
    if (this.sisaSaldo != null) {
      data['sisa_saldo'] = this.sisaSaldo.toJson();
    }
    return data;
  }
}

class SaldoBulanKemarin {
  String debet;
  String kredit;
  String saldo;

  SaldoBulanKemarin({this.debet, this.kredit, this.saldo});

  SaldoBulanKemarin.fromJson(Map<String, dynamic> json) {
    debet = json['debet'];
    kredit = json['kredit'];
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['debet'] = this.debet;
    data['kredit'] = this.kredit;
    data['saldo'] = this.saldo;
    return data;
  }
}
