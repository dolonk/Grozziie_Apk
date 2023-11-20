import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_categories.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_image.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/network/api_url.dart';

import '../data_layer/remote_server/network/BaseApiServices.dart';
import '../data_layer/remote_server/network/NetworkApiService.dart';

class LabelRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<List<BackgroundCategoryModelClass>> fetchBackgroundCategories() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(backgroundImageCategoriesUrl);
      List<dynamic> responseData = response as List<dynamic>;
      List<BackgroundCategoryModelClass> categories = responseData
          .map((json) => BackgroundCategoryModelClass.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }


  Future<List<BackgroundImageModel>> fetchImages(String categoriesName) async {
    try {
      dynamic response =
      await _apiServices.getApiResponse(backgroundImageUrl(categoriesName));
      List<dynamic> responseData = response as List<dynamic>;
      List<BackgroundImageModel> categories = responseData
          .map((json) => BackgroundImageModel.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

}
