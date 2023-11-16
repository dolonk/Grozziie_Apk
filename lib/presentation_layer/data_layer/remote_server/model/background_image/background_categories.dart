class BackgroundCategoryModelClass {
  final int id;
  final String allBackgroundCategories;

  BackgroundCategoryModelClass({required this.id, required this.allBackgroundCategories});

  factory BackgroundCategoryModelClass.fromJson(Map<String, dynamic> json) {
    return BackgroundCategoryModelClass(
      id: json['id'] as int,
      allBackgroundCategories: json['allBackgroundCategoris'] as String,
    );
  }
}