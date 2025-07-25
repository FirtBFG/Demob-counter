import 'package:flutter/material.dart';
import 'package:provider_app1/core/navigation/routes/app_routes.dart';

class ShowAllImagesButton extends StatefulWidget {
  const ShowAllImagesButton({super.key});

  @override
  State<ShowAllImagesButton> createState() => _ShowAllImagesButtonState();
}

class _ShowAllImagesButtonState extends State<ShowAllImagesButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => Navigator.pushNamed(context, AppRoutes.allImages),
      icon: Icon(Icons.image_search_rounded),
      label: Text('Загруженные изображения'),
    );
  }
}
