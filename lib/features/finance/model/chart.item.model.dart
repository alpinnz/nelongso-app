class ChartItemModel {
  String id;
  String label;
  String color;
  List<ChartItem> chartItem;

  ChartItemModel({this.id, this.label, this.color, this.chartItem});

  ChartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    color = json['color'];
    if (json['data'] != null) {
      chartItem = new List<ChartItem>();
      json['data'].forEach((v) {
        chartItem.add(new ChartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['color'] = this.color;
    if (this.chartItem != null) {
      data['chartItem'] = this.chartItem.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartItem {
  DateTime date;
  double value;

  ChartItem({this.date, this.value});

  ChartItem.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['value'] = this.value;
    return data;
  }
}
