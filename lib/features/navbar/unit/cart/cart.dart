import 'package:flutter/material.dart';

import '../../../../core/screen_utils/screen_config.dart';
import '../../../widget/main_text.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainText(
            text: 'مشترياتي',
            font: SizeConfig.safeBlockHorizontal * 10,
          ),
        ],
      ),
    );
  }
}
