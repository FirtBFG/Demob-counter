import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/app/app.dart';
import 'package:provider_app1/core/providers/app_model_provider.dart';
import 'package:provider_app1/core/providers/images_provider.dart';
import 'package:provider_app1/core/repositories/abstr/sh_prefs_repository.dart';
import 'package:provider_app1/core/repositories/impl/sh_prefs_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ShPrefsRepository shPrefsRepository = ShPrefsRepositoryImpl(prefs);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => AppModel(shPrefsRepository)..initModel()),
      ChangeNotifierProvider(
          create: (context) => ImagesProvider(shPrefsRepository)..initData()),
    ],
    child: const MyApp(),
  ));
}
