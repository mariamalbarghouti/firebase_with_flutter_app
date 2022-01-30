import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:trail/app/modules/add_product/controllers/add_product_controller.dart';

// Selected Images
class SelectedImagesWidget extends GetView<AddProductController> {
  //StatelessWidget {
  const SelectedImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.pickedImages.isEmpty)
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  itemCount:
                      controller.pickedImages.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Image
                        Card(
                          color: Colors.amber,
                          clipBehavior: Clip.hardEdge,
                          child: AssetThumb(
                            asset: controller.pickedImages[index],
                            width: 300,
                            height: 300,
                          ),
                        ),
                        // Delete Button
                        Positioned(
                          right: 0,
                          top: -5,
                          child: InkWell(
                            onTap: () async =>
                                await controller.deleteImage(index),
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.delete_outlined,
                                size: 18,
                              ),
                              backgroundColor: Colors.red,
                              radius: 12,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
