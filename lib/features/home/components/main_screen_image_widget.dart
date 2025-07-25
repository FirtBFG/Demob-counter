import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/providers/images_provider.dart';

class MainScreenImageWidget extends StatelessWidget {
  const MainScreenImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagesProvider>(context, listen: true);
    if (imageProvider.currentImage != null) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000), // Длительность анимации
        child: imageProvider.currentImage != null
            ? Image.file(
                key: ValueKey(
                    imageProvider.currentImage!.path), // Важно для анимации
                imageProvider.currentImage!,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Container(key: UniqueKey()),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
    }
    return Container();
  }
}
