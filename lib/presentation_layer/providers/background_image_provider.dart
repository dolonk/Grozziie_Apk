import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/data_layer/remote_server/model/background_image/background_categories.dart';
import 'package:grozziieapk/presentation_layer/repository/label_repository.dart';

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



  ApiResponse<BackgroundCategoryModelClass> categoriesList =
      ApiResponse.loading();

  setCategoriesList(ApiResponse<BackgroundCategoryModelClass> response) {
    categoriesList = response;
    print('categoriesList: $categoriesList');
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

}
