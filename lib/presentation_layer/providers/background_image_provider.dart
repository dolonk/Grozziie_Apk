import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_categories.dart';
import 'package:grozziieapk/presentation_layer/repository/label_repository.dart';
import '../data_layer/remote_server/model/background_image/background_image.dart';
import '../data_layer/remote_server/response/api_response.dart';
import '../ui/created_label/global_variable.dart';

class BackgroundImageProvider with ChangeNotifier {
  final _myRepo = LabelRepository();

  void setBackgroundImageWidget(bool flag) {
    showBackgroundImageContainerWidget = flag;
    notifyListeners();
  }

  void setBackgroundImageContainerFlag(bool flag) {
    showBackgroundImageContainerFlag = flag;
    notifyListeners();
  }

  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isConnected = false;
      notifyListeners();
    } else {
      isConnected = true;
      notifyListeners();
    }
  }

  ApiResponse<List<BackgroundCategoryModelClass>> _categoriesList =
      ApiResponse.loading();

  ApiResponse<List<BackgroundCategoryModelClass>> get categoriesList =>
      _categoriesList;

  void setCategoriesList(
      ApiResponse<List<BackgroundCategoryModelClass>> response) {
    _categoriesList = response;
    notifyListeners();
  }

  Future<void> fetchBackgroundCategoriesApi() async {
    categoriesList.data?.clear();
    imagesList.clear();
    setCategoriesList(ApiResponse.loading());
    try {
      List<BackgroundCategoryModelClass> categories =
          await _myRepo.fetchBackgroundCategories();

      if (categories.isNotEmpty) {
        selectedBackgroundCategory = categories[1].allBackgroundCategories;
        loadImages(selectedBackgroundCategory!);

      }
      setCategoriesList(ApiResponse.completed(categories));
    } catch (error) {
      setCategoriesList(ApiResponse.error(error.toString()));
    }
  }

  List<BackgroundImageModel> imagesList = [];

  Future<void> loadImages(String categoryName) async {
    try {
      imagesList = await _myRepo.fetchImages(categoryName);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching images: $e');
    }
  }

  void setImageList(String categoriesName) async {
    isLoadingDataCheck = true;
    selectedBackgroundCategory = categoriesName;
    await loadImages(selectedBackgroundCategory!);
    isLoadingDataCheck = false;

    notifyListeners();
  }
}
