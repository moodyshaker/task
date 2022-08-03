import 'package:flutter/material.dart';
import 'package:task/core/screen_utils/screen_config.dart';
import 'package:task/features/widget/main_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainText(
            text: 'الاعدادات',
            font: SizeConfig.safeBlockHorizontal * 10,
          ),
        ],
      ),
    );
  }
}
