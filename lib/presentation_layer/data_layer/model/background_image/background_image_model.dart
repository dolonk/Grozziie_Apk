class BackgroundImageModel {
  int? id;
  String? allBackgroundCategoris;
  String? image;
  int? height;
  int? width;

  BackgroundImageModel({
    this.id,
    this.allBackgroundCategoris,
    this.image,
    this.height,
    this.width,
  });

  BackgroundImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allBackgroundCategoris = json['allBackgroundCategoris'];
    image = json['image'] != null
        ? 'https://grozziie.zjweiting.com:8033/tht/backgroundImgs/${json['image']}'
        : 'assets/images/default_icon.png';
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['allBackgroundCategoris'] = allBackgroundCategoris;
    data['image'] = image;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

