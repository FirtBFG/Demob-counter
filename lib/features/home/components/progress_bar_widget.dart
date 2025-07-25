import 'package:flutter/material.dart';
import 'package:provider_app1/core/providers/app_model_provider.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.appModel,
  });

  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(
          height: 0,
          color: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen,
                Colors.redAccent,
              ],
              stops: [
                appModel.leftGradientValue,
                appModel.leftGradientValue + 0.02
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    '${appModel.startDay}.${appModel.startMonth}.${appModel.startYear}'),
                Text(
                    '${appModel.finalDay}.${appModel.finalMonth}.${appModel.finalYear}'),
              ],
            ),
          ),
        ),
        Divider(
          height: 0,
          color: Colors.black,
        ),
      ],
    );
  }
}
