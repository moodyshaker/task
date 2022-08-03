import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:task/core/models/category_model.dart';
import 'package:task/core/networkStatus/network_status.dart';
import 'package:task/features/navbar/unit/notification/notification.dart';

import '../../features/navbar/unit/cart/cart.dart';
import '../../features/navbar/unit/home/home.dart';
import '../../features/navbar/unit/profile/profile.dart';
import '../../features/navbar/unit/settings/settings.dart';
import '../httpHelper/http_helper.dart';
import '../models/slider_model.dart';

class HomeProvider with ChangeNotifier {
  static HomeProvider get(context) => Provider.of<HomeProvider>(context);

  static HomeProvider listenFalse(context) =>
      Provider.of<HomeProvider>(context, listen: false);

  NetworkStatus? _categoryStatus;
  NetworkStatus? _slidersStatus;
  CategoryModel? _category;
  SliderModel? _slider;
  int _currentIndex = 0;
  Widget _current = Home();

  void setIndex(int i) {
    _currentIndex = i;
    getCurrentWidget();
    notifyListeners();
  }

  void getCurrentWidget() {
    log('$_currentIndex');
    switch (_currentIndex) {
      case 0:
        _current = Home();
        break;
      case 1:
        _current = Settings();
        break;
      case 2:
        _current = Cart();
        break;
      case 3:
        _current = Profile();
        break;
      case 4:
        _current = Notifications();
        break;
    }
    log('${_current.runtimeType}');
  }

  Future<void> getCategories(bool retry) async {
    try {
      _categoryStatus = NetworkStatus.loading;
      if (retry) {
        notifyListeners();
      }
      Response r = await HttpHelper.instance.httpGet('categories');
      log('response -> ${r.body}');
      log('statusCode -> ${r.statusCode}');
      if (r.statusCode == 200) {
        _category = CategoryModel.fromJson(json.decode(r.body));
        _categoryStatus = NetworkStatus.success;
      } else {
        _categoryStatus = NetworkStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> getSliders(bool retry) async {
    try {
      _slidersStatus = NetworkStatus.loading;
      if (retry) {
        notifyListeners();
      }
      Response r = await HttpHelper.instance.httpGet('general-slider');
      log('response -> ${r.body}');
      log('statusCode -> ${r.statusCode}');
      if (r.statusCode == 200) {
        _slider = SliderModel.fromJson(json.decode(r.body));
        _slidersStatus = NetworkStatus.success;
      } else {
        _slidersStatus = NetworkStatus.error;
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  NetworkStatus? get slidersStatus => _slidersStatus;

  NetworkStatus? get categoryStatus => _categoryStatus;

  SliderModel? get slider => _slider;

  CategoryModel? get category => _category;

  Widget get current => _current;

  int get currentIndex => _currentIndex;
}
