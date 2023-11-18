import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_categories.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_image.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/network/api_url.dart';

import '../data_layer/remote_server/network/BaseApiServices.dart';
import '../data_layer/remote_server/network/NetworkApiService.dart';

class LabelRepository {

  final BaseApiServices _apiServices = NetworkApiService();

  /*Future<BackgroundCategoryModelClass> fetchBackgroundCategories() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(backgroundImageCategoriesUrl);
      print('response: $response');
      return response = BackgroundCategoryModelClass.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }*/

  Future<List<BackgroundCategoryModelClass>> fetchBackgroundCategories() async {
    try {
      dynamic response =
      await _apiServices.getApiResponse(backgroundImageCategoriesUrl);
      print('response: $response');

      // Assuming your response is a List<dynamic>
      List<dynamic> responseData = response as List<dynamic>;

      // Mapping the dynamic list to a List<BackgroundCategoryModelClass>
      List<BackgroundCategoryModelClass> categories = responseData
          .map((json) => BackgroundCategoryModelClass.fromJson(json))
          .toList();

      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<BackgroundImageModel> fetchBackgroundImages() async {
    try {
      dynamic response =
      await _apiServices.getApiResponse(backgroundImageUrl);
      return BackgroundImageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}
