
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';

import '../../../core/utils/getsize.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;
  const ImageDialog({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              Container(
                margin:  EdgeInsets.symmetric(horizontal: getSize(context)/22),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.primary.withOpacity(0.20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomImage(
                    image: imageUrl, fit: BoxFit.contain, height: MediaQuery.of(context).size.width - 130, width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
               SizedBox(height: getSize(context)/22),
            ]),
        ),
      ),
    );
  }
}