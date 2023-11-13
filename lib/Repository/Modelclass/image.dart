class Image1 {
  Image1({
      this.data,});

  Image1.fromJson(dynamic json) {
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    return map;
  }

}