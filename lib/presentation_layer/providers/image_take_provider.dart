import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../ui/created_label/global_variable.dart';

class ImageTakeProvider extends ChangeNotifier {
  File? imageFile;
  ImagePicker imagePicker = ImagePicker();
  double imageContainerHeight = 100.0;
  double minImageContainerHeight = 50.0;

  void setShowImageContainerFlag(bool flag) {
    showImageContainerFlag = flag;
    notifyListeners();
  }

  void setShowImageWidget(bool flag) {
    showImageWidget = flag;
    notifyListeners();
  }

  void movingWidget(DragUpdateDetails details, int imageIndex){
    imageOffsets[imageIndex] = Offset(
      imageOffsets[imageIndex].dx + details.delta.dx,
      imageOffsets[imageIndex].dy + details.delta.dy,
    );
    notifyListeners();
  }

  void generateImageCode(int detector) {
    imageCodes.add("demoImage");
    imageOffsets.add(Offset(0, (imageCodes.length * 5).toDouble()));
    imageCodesContainerRotations.add(0);
    updateImageSize.add(100);
    selectedImageCodeIndex = imageCodes.length - 1;
    imageBorderWidget = true;
    if (detector == 0) {
      takePicture(imageCodes.length);
    } else {
      selectImage(imageCodes.length);
    }
    notifyListeners();
  }

  void deleteImageCode(int imageIndex) {
    if (imageIndex >= 0 && imageIndex < imageCodes.length) {
      imageCodes.removeAt(imageIndex);

      if (imageIndex < imageOffsets.length) {
        imageOffsets.removeAt(imageIndex);
      }
      if (imageIndex < updateImageSize.length) {
        imageCodesContainerRotations.removeAt(imageIndex);
      }
      if (imageIndex < updateImageSize.length) {
        updateImageSize.removeAt(imageIndex);
      }
      imageBorderWidget = false;
    }
  }

  Future<void> takePicture(int myIndex) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      cropImage(File(pickedFile.path), myIndex);
    }
  }

  Future<void> selectImage(int myIndex) async {
    try {
      final pickedImage = await imagePicker.pickImage(
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 20,
        source: ImageSource.gallery,
      );

      if (pickedImage != null) {
        cropImage(File(pickedImage.path), myIndex);
      }
    } catch (e) {
      debugPrint('Error selecting image: $e');
    }
  }

  //Crop Image
  Future<void> cropImage(File imageFile, int myIndex) async {
    final imageCropper = ImageCropper();
    final croppedFile = await imageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      imageCodes[myIndex - 1] = croppedFile.path;
      showImageWidget = true;
      notifyListeners();
    }
  }

  void handleResizeGesture(DragUpdateDetails details, int? imageIndex) {
    if (selectedImageCodeIndex == imageIndex) {
      final newImageSize =
          updateImageSize[selectedImageCodeIndex] + details.delta.dx;

      updateImageSize[selectedImageCodeIndex] =
          newImageSize >= minImageContainerHeight
              ? newImageSize
              : minImageContainerHeight;
    }
    notifyListeners();
  }
}
