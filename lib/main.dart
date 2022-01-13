import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'styles/palette.dart';
import 'HomeView/homeMain.view.dart';
import 'styles/colors.dart';
import 'PostView/post.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.pastelBlue,
            primarySwatch: Palette.theme,
            bottomAppBarColor: const Color(0xfff7f7f9)),
        home: const HomeMainView());
  }
}
