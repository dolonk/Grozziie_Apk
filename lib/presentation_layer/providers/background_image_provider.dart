
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/repository/label_repository.dart';
import '../data_layer/model/background_image/background_image_model.dart';
import '../data_layer/remote_server/response/api_response.dart';
import '../ui/created_label/global_variable.dart';

class BackgroundImageProvider with ChangeNotifier {
  final _myRepo = LabelRepository();

  ApiResponse<List<BackgroundImageModel>> categoriesList =
      ApiResponse.loading();

  List<BackgroundImageModel> imagesList = [];

  void setBackgroundImageWidget(bool flag) {
    showBackgroundImageContainerWidget = flag;
    notifyListeners();
  }

  void setBackgroundImageContainerFlag(bool flag) {
    showBackgroundImageContainerFlag = flag;
    notifyListeners();
  }

  void setCategoriesList(ApiResponse<List<BackgroundImageModel>> response) {
    categoriesList = response;
    notifyListeners();
  }

  void setImageList(String categoriesName) async {
    isLoadingDataCheck = true;
    selectedBackgroundCategory = categoriesName;
    await loadImages(selectedBackgroundCategory!);
    isLoadingDataCheck = false;

    notifyListeners();
  }

  Future<void> fetchBackgroundCategoriesApi() async {
    categoriesList.data?.clear();
    imagesList.clear();
    setCategoriesList(ApiResponse.loading());
    try {
      List<BackgroundImageModel> categories =
          await _myRepo.fetchBackgroundCategories();

      if (categories.isNotEmpty) {
        selectedBackgroundCategory = categories[1].allBackgroundCategoris;
        loadImages(selectedBackgroundCategory!);
      }
      setCategoriesList(ApiResponse.completed(categories));
    } catch (error) {
      setCategoriesList(ApiResponse.error(error.toString()));
    }
  }

  Future<void> loadImages(String categoryName) async {
    try {
      imagesList = await _myRepo.fetchImages(categoryName);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching images: $e');
    }
  }
}
