import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/function_template/show_text_editing_container.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/utils.dart';
import '../../../providers/date_time_editing_provider.dart';
import '../../../providers/text_editing_provider.dart';
import '../global_variable.dart';

class ShowDateTimeEditingContainer extends StatelessWidget {
  const ShowDateTimeEditingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, _) {
        return Consumer<TextEditingProvider>(
          builder: (context, textModel, _) {
            return Consumer<OnTouchFunctionProvider>(builder: (context, onTouch, child) {
              return Stack(children: [
                Container(
                  padding: REdgeInsets.only(bottom: 30.h),
                  margin: REdgeInsets.only(top: 10.h),
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/icons/rectangle.png'),
                ),
                Container(
                  margin: REdgeInsets.only(top: 15.h),
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: const Color(0xff5DBCFF).withOpacity(0.13),
                    borderRadius: BorderRadius.all(Radius.circular(13.w)),
                  ),
                  child: Column(
                    children: [
                      ReuseAbleClass().buildOptionRow(
                        [
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/template.png', 'Template', () async{
                            await onTouch.showBorderContainerFlag('textEditing', false);
                          }),
                          Image.asset('assets/images/line_c.png'),
                          ReuseAbleClass().buildTextIonButton(
                              'assets/icons/delete_icon.png', 'Delete', () async{
                            textModel.deleteTextCode(selectedTextCodeIndex);
                            await onTouch.showBorderContainerFlag('date', false);
                          }),
                          /*  _buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                          ReuseAbleClass().buildTextIonButton(
                              'assets/icons/rotated_icon.png', 'Rotate', () {
                            onTouch.rotateFunction(textContainerRotations, selectedTextCodeIndex);
                          }),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      if (dateTimeModel.showStyleContainer)
                        Expanded(
                            child: SingleChildScrollView(
                                child: const ShowTextEditingContainer()
                                    .textEditingOptions(context)))
                      else
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 150.h,
                              width: screenWidth,
                              color: Colors.white,
                              padding: REdgeInsets.symmetric(
                                  horizontal: 15, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Date & Format:',
                                        style: bodySmall,
                                      ),
                                      SizedBox(width: 10.w),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey),
                                          onPressed: () {
                                            dateTimeModel
                                                .showDatePickerDialog(context);
                                          },
                                          child:
                                          const Text('Select Date & Format')),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Time & Format :',
                                        style: bodySmall,
                                      ),
                                      SizedBox(width: 10.w),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey),
                                          onPressed: () {
                                            dateTimeModel
                                                .showTimeDatePickerDialog(
                                                context);
                                          },
                                          child:
                                          const Text('Select Time & Format')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Container(
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        width: screenWidth,
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  dateTimeModel.setShowStyleContainer(false);
                                },
                                child: Text(
                                  'Format',
                                  style: dateTimeModel.showStyleContainer
                                      ? bodySmall
                                      : bodySmall.copyWith(color: Colors.blue),
                                )),
                            TextButton(
                                onPressed: () {
                                  dateTimeModel.setShowStyleContainer(true);
                                },
                                child: Text(
                                  'Style',
                                  style: dateTimeModel.showStyleContainer
                                      ? bodySmall.copyWith(color: Colors.blue)
                                      : bodySmall,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]);
            },);


          },
        );
      },
    );
  }
}
