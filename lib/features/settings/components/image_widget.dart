import 'package:flutter/material.dart';
import 'package:provider_app1/core/models/my_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
  });

  final MyImage image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Image.file(
          image.file,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
