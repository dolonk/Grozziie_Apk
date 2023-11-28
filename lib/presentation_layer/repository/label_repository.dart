import 'package:http/http.dart' as http;
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/network/api_url.dart';
import '../data_layer/model/background_image/background_image_model.dart';
import '../data_layer/model/icon_image/icon_model_class.dart';
import '../data_layer/remote_server/network/BaseApiServices.dart';
import '../data_layer/remote_server/network/NetworkApiService.dart';

class LabelRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<List<BackgroundImageModel>> fetchBackgroundCategories() async {
    try {
      dynamic response = await _apiServices
          .getApiResponse(AppUrl.backgroundImageCategoriesUrl);
      List<dynamic> responseData = response as List<dynamic>;
      List<BackgroundImageModel> categories = responseData
          .map((json) => BackgroundImageModel.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BackgroundImageModel>> fetchImages(String categoriesName) async {
    try {
      dynamic response = await _apiServices
          .getApiResponse(AppUrl.backgroundImageUrl(categoriesName));
      List<dynamic> responseData = response as List<dynamic>;
      List<BackgroundImageModel> categories = responseData
          .map((json) => BackgroundImageModel.fromJson(json))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<IconImageModel>> fetchIconCategories() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.iconCategoriesUrl);
      List<dynamic> responseData = response as List<dynamic>;
      List<IconImageModel> categories =
          responseData.map((json) => IconImageModel.fromJson(json)).toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<IconImageModel>> fetchIconImages(String categoriesName) async {
    try {
      dynamic response = await _apiServices
          .getApiResponse(AppUrl.iconImagesUrl(categoriesName));
      List<dynamic> responseData = response as List<dynamic>;
      List<IconImageModel> categories =
          responseData.map((json) => IconImageModel.fromJson(json)).toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> downloadIconImages(String imageUrl) async {
    try {
      dynamic response = await _apiServices.getApiResponse(imageUrl);
      return response = response.bodyBytes;
    } catch (e) {
      rethrow;
    }
  }
}
