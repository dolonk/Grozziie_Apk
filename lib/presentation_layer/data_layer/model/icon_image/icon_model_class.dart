class IconImageModel {
  int? id;
  String? allIconsCategoris;
  String? icon;

  IconImageModel({this.id, this.allIconsCategoris, this.icon});

  IconImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allIconsCategoris = json['allIconsCategoris'];
    icon = json['icon'] != null
        ? 'https://grozziie.zjweiting.com:8033/tht/images/${json['icon']}'
        : 'assets/images/default_icon.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['allIconsCategoris'] = allIconsCategoris;
    data['icon'] = icon;
    return data;
  }

}
