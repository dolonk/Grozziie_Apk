import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/utils/app_style.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../data_layer/model/background_image/background_image_model.dart';
import '../../../data_layer/remote_server/response/api_response.dart';
import '../../../data_layer/remote_server/response/status.dart';
import '../../../providers/background_image_provider.dart';
import '../global_variable.dart';

// ignore: must_be_immutable
class ShowBackgroundImageContainer extends StatefulWidget {
  BackgroundImageProvider backgroundImageModel = BackgroundImageProvider();

  ShowBackgroundImageContainer({Key? key, required this.backgroundImageModel})
      : super(key: key);

  @override
  State<ShowBackgroundImageContainer> createState() =>
      _ShowBackgroundImageContainerState();
}

class _ShowBackgroundImageContainerState
    extends State<ShowBackgroundImageContainer> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.backgroundImageModel.fetchBackgroundCategoriesApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BackgroundImageProvider>(
        builder: (context, bImageModel, child) {
      return Stack(
        children: [
          Container(
            padding: REdgeInsets.only(bottom: 30.h),
            margin: REdgeInsets.only(top: 10.h),
            alignment: Alignment.topCenter,
            child: Image.asset('assets/icons/rectangle.png'),
          ),
          Container(
            margin: REdgeInsets.only(top: 10.h),
            width: screenWidth,
            decoration: BoxDecoration(
              color: const Color(0xff5DBCFF).withOpacity(0.13),
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 65.h,
                  width: screenWidth,
                  child: Column(
                    children: [
                      ReuseAbleClass().buildOptionRow([
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/template.png', 'Template', () async {
                          bImageModel.setBackgroundImageContainerFlag(false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {}),
                      ]),
                    ],
                  ),
                ),
                Container(
                  height: 175.h,
                  color: Colors.white,
                  child: Center(
                      child: _buildCategoriesList(
                          bImageModel.categoriesList, bImageModel)),
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildCategoriesList(
      ApiResponse<List<BackgroundImageModel>> categoriesList,
      BackgroundImageProvider backgroundImageModel) {
    switch (categoriesList.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return categoriesList.data != null
            ? Column(
                children: [
                  // Categories list
                  SizedBox(
                    height: 50.h,
                    width: screenWidth,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesList.data!.length,
                      itemBuilder: (context, index) {
                        var categorisName =
                            categoriesList.data![index].allBackgroundCategoris;
                        return GestureDetector(
                          onTap: () async {
                            backgroundImageModel.imagesList.clear();
                            backgroundImageModel.setImageList(categorisName);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (selectedBackgroundCategory ==
                                            categorisName)
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(categorisName!),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Image View Container
                  SizedBox(
                    height: 125.h,
                    width: double.infinity,
                    child: isLoadingDataCheck
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 100,
                            ),
                            itemCount: backgroundImageModel.imagesList.length,
                            itemBuilder: (context, index) {
                              var height =
                                  backgroundImageModel.imagesList[index].height;
                              var width =
                                  backgroundImageModel.imagesList[index].width;
                              var imageUrl =
                                  backgroundImageModel.imagesList[index].image;
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          imageUrl!,
                                          height: 70,
                                          width: double.infinity,
                                        ),
                                        Text('Size: $height * $width'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              )
            : SizedBox(
                width: screenWidth,
                child: const Center(child: Text('Data is null')),
              );
      case Status.ERROR:
        return Center(
          child: Column(
            children: [
              Text('Error: ${categoriesList.message}'),
              Align(
                alignment: Alignment.center,
                child: ReusableButton(
                    height: 35.h,
                    width: 110.w,
                    buttonColor: primaryBlue,
                    text: 'Reload',
                    onPressed: () {
                      backgroundImageModel.fetchBackgroundCategoriesApi();
                    }),
              )
            ],
          ),
        );

      default:
        return Container();
    }
  }
}
