import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/global_variable.dart';
import '../data_layer/model/icon_image/icon_model_class.dart';
import '../data_layer/remote_server/response/api_response.dart';
import '../repository/label_repository.dart';

class IconProvider with ChangeNotifier {
  final _myRepo = LabelRepository();

  ApiResponse<List<IconImageModel>> iconsCategories = ApiResponse.loading();

  List<IconImageModel> iconImages = [];

  void setIconWidget(bool flag) {
    showImageWidget = flag;
    notifyListeners();
  }

  void setIconContainerFlag(bool flag) {
    showIconContainerFlag = flag;
    notifyListeners();
  }

  void setIconCategoriesList(ApiResponse<List<IconImageModel>> response) {
    iconsCategories = response;
    notifyListeners();
  }

  void setIconImageList(String categoriesName) async {
    isLoadingDataCheck = true;
    selectedIconCategory = categoriesName;
    await loadIconImages(selectedIconCategory!);
    isLoadingDataCheck = false;

    notifyListeners();
  }

  Future<void> fetchIconCategoriesApi() async {
    iconsCategories.data?.clear();
    iconImages.clear();
    setIconCategoriesList(ApiResponse.loading());
    try {
      List<IconImageModel> categories = await _myRepo.fetchIconCategories();

      if (categories.isNotEmpty) {
        selectedIconCategory = categories[0].allIconsCategoris;
        loadIconImages(selectedIconCategory!);
      }
      setIconCategoriesList(ApiResponse.completed(categories));
    } catch (error) {
      setIconCategoriesList(ApiResponse.error(error.toString()));
    }
  }

  Future<void> loadIconImages(String categoryName) async {
    try {
      iconImages = await _myRepo.fetchIconImages(categoryName);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching images: $e');
    }
  }

  void generateIcon(dynamic selectImage) {
    iconCodes.add('Icon');
    iconCodeOffsets.add(Offset(0, (iconCodes.length * 5).toDouble()));
    selectedIcons.add(selectImage);
    iconCodesContainerRotations.add(0);
    updatedIconWidth.add(50);
    selectedIconCodeIndex = iconCodes.length - 1;
    notifyListeners();
  }

  void deleteEmojiCode(int iconIndex) {
    if (iconIndex >= 0 && iconIndex < iconCodes.length) {
      iconCodes.removeAt(iconIndex);
      iconCodeOffsets.removeAt(iconIndex);

      if (iconIndex < selectedIcons.length) {
        selectedIcons.removeAt(iconIndex);
      }

      if (iconIndex < updatedIconWidth.length) {
        updatedIconWidth.removeAt(iconIndex);
      }
      if (iconIndex < iconCodesContainerRotations.length) {
        iconCodesContainerRotations.removeAt(iconIndex);
      }
      notifyListeners();
    }
  }

  void handleResizeGesture(DragUpdateDetails details, int? iconIndex) {
    double minEmojiWidth = 30.0;
    if (selectedIconCodeIndex == iconIndex) {
      final newEmojiSize =
          updatedIconWidth[selectedIconCodeIndex] + details.delta.dx;

      updatedIconWidth[selectedIconCodeIndex] =
          newEmojiSize >= minEmojiWidth ? newEmojiSize : minEmojiWidth;
      notifyListeners();
    }
  }
}
