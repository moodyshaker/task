import 'package:flutter/material.dart';
import 'package:task/features/widget/customTextFeild.dart';

import '../../../../../core/screen_utils/screen_config.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      child: CustomTextField(
        suffixIcon: Icons.search,
        hint: 'كلمة البحث',
      ),
    );
  }
}
