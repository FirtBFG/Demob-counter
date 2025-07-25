import 'package:flutter/material.dart';
import 'package:provider_app1/features/settings/components/change_start_date_button.dart';
import 'package:provider_app1/features/settings/components/image_pick_button.dart';
import 'package:provider_app1/features/settings/components/show_all_images_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeStartDateButton(),
            ImagePickButton(),
            ShowAllImagesButton(),
          ],
        ),
      ),
    );
  }
}
