import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/remote_server/model/background_image/background_categories.dart';
import '../../../data_layer/remote_server/response/status.dart';
import '../../../providers/background_image_provider.dart';
import '../../../repository/label_repository.dart';
import '../global_variable.dart';

class ShowBackgroundImageContainer extends StatefulWidget {
  const ShowBackgroundImageContainer({super.key});

  @override
  State<ShowBackgroundImageContainer> createState() => _ShowBackgroundImageContainerState();
}

class _ShowBackgroundImageContainerState extends State<ShowBackgroundImageContainer> {
  BackgroundImageProvider backgroundImageModel= BackgroundImageProvider();


  @override
  void initState() {
    //backgroundImageModel.fetchBackgroundCategories();
    backgroundImageModel.fetchBackgroundCategoriesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BackgroundImageProvider>(
      create: (BuildContext context) => backgroundImageModel,
      child:Consumer<BackgroundImageProvider>(
          builder: (context, bImageModel, child) {
            /*switch (bImageModel.categoriesList.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(
                child: Text(bImageModel.categoriesList.message.toString()));
          case Status.COMPLETED:*/
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
                                    bImageModel
                                        .setBackgroundImageContainerFlag(false);
                                  }),
                              Image.asset('assets/images/line_c.png'),
                              ReuseAbleClass().buildTextIonButton(
                                  'assets/icons/delete_icon.png',
                                  'Delete',
                                      () {}),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                          height: 175.h,
                          color: Colors.white,
                          child: Column(
                            children: [
                              // show Categories list
                              Container(
                                height: 50.h,
                                color: Colors.yellow,
                                child: categoriesList(bImageModel),
                              ),

                              // Image View
                              Expanded(
                                child: Container(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            );
            //case null:
          }
        /* return Container();
      },*/
      ) ,
    );
      
      

  }

  Widget categoriesList(BackgroundImageProvider bImageModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      //itemCount:bImageModel.backgroundCategories.length,
      itemCount:bImageModel.categoriesList.data?.allBackgroundCategories.length,
      itemBuilder: (context, index) {
        /*value.moviesList.data!.movies![index].posterurl.toString(),*/
        //var categorisList = bImageModel.categoriesList.data?.allBackgroundCategories[index];
        var categorisList = bImageModel.categoriesList.data?.allBackgroundCategories;
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
}