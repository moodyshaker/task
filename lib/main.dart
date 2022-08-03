import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/providers/home_provider.dart';
import 'package:task/features/navbar/navbar.dart';

import 'features/navbar/unit/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: "Task",
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Directionality(
          child: child!,
          textDirection: TextDirection.rtl,
        ),
        home: NavBar(),
      ),
    );
  }
}
