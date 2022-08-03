import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/core/providers/home_provider.dart';
import 'package:task/core/screen_utils/screen_config.dart';
import 'package:task/features/navbar/unit/home/units/slider_item.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  var _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final home = HomeProvider.get(context);
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: home.slider!.data!.length,
      options: CarouselOptions(
        height: SizeConfig.safeBlockVertical * 25,
        viewportFraction: 0.8,
        initialPage: _current,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      itemBuilder: (context, index, _) => SliderItem(current: _current),
    );
  }
}
