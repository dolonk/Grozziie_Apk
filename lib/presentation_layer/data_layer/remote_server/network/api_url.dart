class AppUrl {

  static const baseUrl = 'https://grozziie.zjweiting.com:8033/tht/';

  static const backgroundImageCategoriesUrl = '${baseUrl}BackgroundCategories';

  static backgroundImageUrl(String categoriesName) =>
      '${baseUrl}backgroundImgs/$categoriesName';

  static const iconCategoriesUrl = '${baseUrl}iconCategories';

  static iconImagesUrl(String categoriesName) =>
      '${baseUrl}icons/$categoriesName';
}
