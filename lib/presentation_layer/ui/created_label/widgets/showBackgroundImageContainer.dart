import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/remote_server/response/status.dart';
import '../../../providers/background_image_provider.dart';
import '../global_variable.dart';

class ShowBackgroundImageContainer extends StatelessWidget {
  const ShowBackgroundImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BackgroundImageProvider>(
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

      // case null:
    }
        //return Container();
        //},
        );
  }

  Widget categoriesList(BackgroundImageProvider bImageModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bImageModel.categoriesList.data?.allBackgroundCategories.length,
      itemBuilder: (context, index) {
        var categorisList = bImageModel.categoriesList.data?.allBackgroundCategories;
        print('Dolon categorisList : $categorisList');
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
             // child: Text(categorisList),
            ),
          ),
        );
      },
    );
  }
}
