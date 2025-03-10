class VariantType {
  String? sId;
  String? name;

  VariantType({this.sId, this.name});

  VariantType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}