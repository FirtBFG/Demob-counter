import 'package:flutter/material.dart';
import 'package:provider_app1/core/navigation/presentation/main_screen.dart';
import 'package:provider_app1/core/navigation/routes/app_routes.dart';
import 'package:provider_app1/features/settings/presentation/all_images_screen.dart';
import 'package:provider_app1/features/settings/presentation/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => MainScreen(),
        AppRoutes.settings: (context) => SettingsPage(),
        AppRoutes.allImages: (context) => AllImagesScreen(),
      },
    );
  }
}
