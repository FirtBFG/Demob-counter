import 'package:flutter/material.dart';
import 'package:provider_app1/features/home/components/days_counter_widget.dart';
import 'package:provider_app1/features/home/components/main_screen_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Дембель'),
      ),
      body: Stack(
        children: [
          MainScreenImageWidget(),
          DaysCounterWidget(),
        ],
      ),
    );
  }
}
