import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../data_layer/remote_server/model/background_image/background_categories.dart';
import '../../../data_layer/remote_server/response/api_response.dart';
import '../../../data_layer/remote_server/response/status.dart';
import '../../../providers/background_image_provider.dart';
import '../global_variable.dart';
import '../global_variable.dart';
import '../global_variable.dart';

/*class ShowBackgroundImageContainer extends StatelessWidget {
  const ShowBackgroundImageContainer({super.key});

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
                   // child: _buildCategoriesList(bImageModel.categoriesList))
                    child: categoriesList(bImageModel))
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildCategoriesList(
      ApiResponse<List<BackgroundCategoryModelClass>> categoriesList) {
    switch (categoriesList.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return categoriesList.data != null
            ? Column(
                children: [
                  ListView.builder(
                    itemCount: categoriesList.data!.length,
                    itemBuilder: (context, index) {
                      var categorisName =
                          categoriesList.data![index].allBackgroundCategories;
                      print("categorisList: $categorisName");
                      return ListTile(
                        title: Text(categorisName),
                      );
                    },
                  ),
                  // Image View Container
                  Container()
                ],
              )
            : Container(
                width: screenWidth,
                child: Center(child: Text('Data is null')),
              ); // Handle case where data is null
      case Status.ERROR:
        return Center(child: Text('Error: ${categoriesList.message}'));
      default:
        return Container();
    }
  }



  Widget categoriesList(BackgroundImageProvider bImageModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:bImageModel.backgroundCategories.length,
      itemBuilder: (context, index) {
        var categorisList = bImageModel.backgroundCategories[index].allBackgroundCategories;
        print('categorisList: $categorisList');
        return GestureDetector(
          onTap: () async {},
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    color: (selectedBackgroundCategory == categorisList)
                        ? Colors.blue
                        : Colors.black,
                    width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(5),
              //child: Text(categorisList),
            ),
          ),
        );
      },
    );
  }

}*/

class ShowBackgroundImageContainer extends StatefulWidget {
  const ShowBackgroundImageContainer({super.key});

  @override
  State<ShowBackgroundImageContainer> createState() =>
      _ShowBackgroundImageContainerState();
}

class _ShowBackgroundImageContainerState
    extends State<ShowBackgroundImageContainer> {
  BackgroundImageProvider backgroundImageModel = BackgroundImageProvider();

  @override
  void initState() {
    backgroundImageModel.fetchBackgroundCategoriesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BackgroundImageProvider>(
      create: (BuildContext context) => backgroundImageModel,
      child: Consumer<BackgroundImageProvider>(
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
                              'assets/icons/template.png', 'Template',
                              () async {
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
                    child: _buildCategoriesList(bImageModel.categoriesList),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }




  Widget _buildCategoriesList(
      ApiResponse<List<BackgroundCategoryModelClass>> categoriesList,
      VoidCallback onReload,
      ) {
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
                      categoriesList.data![index].allBackgroundCategories;
                  return GestureDetector(
                    onTap: () async {},
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
                        child: Text(categorisName),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Image View Container
            Container()
          ],
        )
            : SizedBox(
          width: screenWidth,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Data is null'),
                if (!isConnected)
                  ElevatedButton(
                    onPressed: onReload,
                    child: const Text('Reload'),
                  ),
              ],
            ),
          ),
        );
      case Status.ERROR:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${categoriesList.message}'),
              ElevatedButton(
                onPressed: onReload,
                child: const Text('Reload'),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }




/*  Widget _buildCategoriesList(
      ApiResponse<List<BackgroundCategoryModelClass>> categoriesList) {
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
                            categoriesList.data![index].allBackgroundCategories;
                        return GestureDetector(
                          onTap: () async {},
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
                              child: Text(categorisName),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Image View Container
                  Container()
                ],
              )
            : SizedBox(
                width: screenWidth,
                child: const Center(child: Text('Data is null')),
              );
      case Status.ERROR:
        return Center(child: Text('Error: ${categoriesList.message}'));

      default:
        return Container();
    }
  }*/
}
