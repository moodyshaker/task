import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:task/core/models/category_model.dart';
import 'package:task/core/providers/home_provider.dart';
import 'package:task/core/screen_utils/screen_config.dart';

import '../../../../../const.dart';
import '../../../../widget/main_text.dart';

class CategoryItem extends StatelessWidget {
  final Data data;

  const CategoryItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FancyShimmerImage(
          imageUrl: data.image!,
          height: 25 * SizeConfig.safeBlockVertical,
          // width: 25 * SizeConfig.safeBlockHorizontal,
          errorWidget: Image.asset(
            getAsset('image_error'),
            height: 25 * SizeConfig.safeBlockVertical,
            width: 25 * SizeConfig.safeBlockHorizontal,
          ),
        ),
        SizedBox(
          height: 2 * SizeConfig.safeBlockVertical,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainText(
              text: data.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              font: SizeConfig.safeBlockHorizontal * 3.5,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
