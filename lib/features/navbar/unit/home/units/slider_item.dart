import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:task/core/screen_utils/screen_config.dart';
import '../../../../../const.dart';
import '../../../../../core/providers/home_provider.dart';

class SliderItem extends StatelessWidget {
  final int current;

  const SliderItem({
    required this.current,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = HomeProvider.get(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1),
      child: FancyShimmerImage(
        imageUrl: home.slider!.data![current].image!,
        errorWidget: Image.asset(
          getAsset('image_error'),
        ),
      ),
    );
  }
}
