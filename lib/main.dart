import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/app/app.dart';
import 'package:provider_app1/core/providers/app_model_provider.dart';
import 'package:provider_app1/core/providers/images_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppModel(prefs)..initModel()),
      ChangeNotifierProvider(
          create: (context) => ImagesProvider(prefs)..initData()),
    ],
    child: const MyApp(),
  ));
}
