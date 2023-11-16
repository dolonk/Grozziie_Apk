class BackgroundImageModel {
  int? id;
  String? image;
  String? userEmail;
  String? categoryName;
  int? height;
  int? width;

  BackgroundImageModel(
      {this.id,
        this.image,
        this.userEmail,
        this.categoryName,
        this.height,
        this.width});

  BackgroundImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'] != null
        ? 'https://grozziie.zjweiting.com:8033/tht/backgroundImgs/${json['image']}'
        : 'assets/images/default_icon.png';
    userEmail = json['userEmail'];
    categoryName = json['categoryName'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['userEmail'] = this.userEmail;
    data['categoryName'] = this.categoryName;
    data['height'] = this.height;
    data['width'] = this.width;
    return data;
  }
}
