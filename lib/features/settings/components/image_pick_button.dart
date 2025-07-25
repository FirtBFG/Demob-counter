import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/providers/images_provider.dart';

class ImagePickButton extends StatelessWidget {
  const ImagePickButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () =>
          Provider.of<ImagesProvider>(context, listen: false).pickImages(),
      icon: Icon(Icons.image),
      label: Text('Загрузить изображения'),
    );
  }
}
