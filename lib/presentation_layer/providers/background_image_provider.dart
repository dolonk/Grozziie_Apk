import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_categories.dart';
import 'package:grozziieapk/presentation_layer/repository/label_repository.dart';

import '../data_layer/remote_server/response/api_response.dart';
import '../data_layer/remote_server/response/status.dart';
import '../ui/created_label/global_variable.dart';

/*class BackgroundImageProvider with ChangeNotifier {
  final _myRepo = LabelRepository();

  // Categories list
  List<BackgroundCategoryModelClass> fetchedCategories = [];

  void setBackgroundImageWidget(bool flag) {
    showBackgroundImageContainerWidget = flag;
    notifyListeners();
  }

  void setBackgroundImageContainerFlag(bool flag) {
    showBackgroundImageContainerFlag = flag;
    notifyListeners();
  }

  ApiResponse<BackgroundCategoryModelClass> categoriesList =
  ApiResponse.loading();

  setCategoriesList(ApiResponse<BackgroundCategoryModelClass> response) {
    categoriesList = response;

    // Set categories if the response is completed
    if (response.status == Status.COMPLETED) {
      fetchedCategories = response.data?.allBackgroundCategories;
    }

    notifyListeners();
  }

  Future<void> fetchBackgroundCategoriesApi() async {
    setCategoriesList(ApiResponse.loading());

    _myRepo.fetchBackgroundCategories().then((value) {
      setCategoriesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setCategoriesList(ApiResponse.error(error.toString()));
    });
  }

}*/

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


ApiResponse<BackgroundCategoryModelClass> categoriesList =
      ApiResponse.loading();

  setCategoriesList(ApiResponse<BackgroundCategoryModelClass> response) {
    categoriesList = response;
    notifyListeners();
  }

  Future<void> fetchBackgroundCategoriesApi() async {

    setCategoriesList(ApiResponse.loading());

    _myRepo.fetchBackgroundCategories().then((value) {
      setCategoriesList(ApiResponse.completed(value));
      print('DolonBd: ${ApiResponse.completed(value)}');
    }).onError((error, stackTrace) {
      setCategoriesList(ApiResponse.error(error.toString()));
    });

  }

  /*List<BackgroundCategoryModelClass> _backgroundCategories = [];

  List<BackgroundCategoryModelClass> get backgroundCategories => _backgroundCategories;

  void setBackgroundCategories(List<BackgroundCategoryModelClass> categories) {
    _backgroundCategories = categories;
    notifyListeners();
  }
  Future<void> fetchBackgroundCategories() async {
    try {
      List<BackgroundCategoryModelClass> categories =
      await _myRepo.fetchBackgroundCategories();
      setBackgroundCategories(categories);
    } catch (e) {
      print('Error fetching background categories: $e');
    }
  }*/

}

