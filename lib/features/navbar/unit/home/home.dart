import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/core/networkStatus/network_status.dart';
import 'package:task/core/providers/home_provider.dart';
import 'package:task/features/navbar/unit/home/units/screen_content.dart';
import 'package:task/features/navbar/unit/home/units/search_bar.dart';
import 'package:task/features/navbar/unit/home/units/slider.dart';
import 'package:task/features/widget/main_text.dart';
import 'package:task/features/widget/retry_widget.dart';
import '../../../../core/screen_utils/screen_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    _homeProvider = HomeProvider.listenFalse(context);
    _homeProvider.getSliders(false);
    _homeProvider.getCategories(false);
  }

  @override
  Widget build(BuildContext context) {
    final home = HomeProvider.get(context);
    return (home.categoryStatus == NetworkStatus.loading ||
            home.slidersStatus == NetworkStatus.loading)
        ? Center(child: SpinKitDoubleBounce(color: Colors.orange))
        : (home.categoryStatus == NetworkStatus.success &&
                home.slidersStatus == NetworkStatus.success)
            ? SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 3),
                  child: Column(
                    children: [
                      SearchBar(),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Sliders(),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 2,
                      ),
                      MainText(
                        text: 'من وين حابب تجمع نقاطك اليوم ؟',
                        font: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.black,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 0.1,
                      ),
                      MainText(
                        text: 'اهلاً بك Ahmed Hassan',
                        font: SizeConfig.safeBlockHorizontal * 4,
                        color: Colors.black,
                        weight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      ScreenContent(),
                    ],
                  ),
                ),
              )
            : RetryWidget(retryCallback: () {
                home.getSliders(true);
                home.getCategories(true);
              });
  }
}
