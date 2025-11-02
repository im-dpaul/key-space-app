class PayLoad {
  String? type;
  String? payloadData;

  PayLoad({this.type, this.payloadData});

  PayLoad.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    payloadData = json['payloadData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['payloadData'] = payloadData;
    return data;
  }
}
