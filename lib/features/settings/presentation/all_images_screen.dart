import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/providers/images_provider.dart';
import 'package:provider_app1/features/settings/components/check_circle_widget.dart';
import 'package:provider_app1/features/settings/components/image_widget.dart';

class AllImagesScreen extends StatefulWidget {
  const AllImagesScreen({super.key});

  @override
  State<AllImagesScreen> createState() => _AllImagesScreenState();
}

class _AllImagesScreenState extends State<AllImagesScreen> {
  List<int> selectedImages = [];
  void selectImage(List<int> selectedImages, int index) {
    return setState(() {
      if (selectedImages.contains(index)) {
        selectedImages.remove(index);
      } else {
        selectedImages.add(index);
      }
    });
  }

  Future<bool> _showAcceptDialog() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Удаление'),
        content: Text('Вы точно хотите удалить выбранные изображения?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Отмена')),
          TextButton(
              onPressed: () => Navigator.pop(context, true), child: Text('Да')),
        ],
      ),
    );
    return confirm;
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImagesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Все изображения'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Stack(
              children: [
                ImageWidget(image: imageProvider.images[index]),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child:
                      CheckCircle(isSelected: selectedImages.contains(index)),
                ),
              ],
            ),
            onTap: () => selectImage(selectedImages, index),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imageProvider.images.length,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          onPressed: () async {
            bool accept = await _showAcceptDialog();
            if (accept) {
              imageProvider.deleteImages(selectedImages);
              selectedImages = [];
            }
          },
          child: Icon(Icons.delete),
        ),
      ),
    );
  }
}
