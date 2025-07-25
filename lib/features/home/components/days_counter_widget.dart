import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/providers/app_model_provider.dart';
import 'package:provider_app1/features/home/components/progress_bar_widget.dart';

class DaysCounterWidget extends StatelessWidget {
  const DaysCounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: true);
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black),
                ),
              ),
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  appModel.daysToFinal.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  style: TextStyle(
                    fontSize: 100,
                    fontFamily: 'Samson',
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            ProgressBarWidget(appModel: appModel),
          ],
        ),
      ),
    );
  }
}
