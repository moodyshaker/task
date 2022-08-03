import 'package:flutter/material.dart';
import 'package:task/core/screen_utils/screen_config.dart';

import '../../../../../core/providers/home_provider.dart';
import 'category_item.dart';

class ScreenContent extends StatelessWidget {
  const ScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = HomeProvider.get(context);
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: 10 * SizeConfig.safeBlockHorizontal),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1 * (
                SizeConfig.safeBlockHorizontal / SizeConfig.safeBlockVertical),
            crossAxisSpacing: 2 * SizeConfig.safeBlockHorizontal),
        itemCount: home.category!.data!.length,
        itemBuilder: (BuildContext ctx, int i) =>
            CategoryItem(data: home.category!.data![i]));
  }
}
