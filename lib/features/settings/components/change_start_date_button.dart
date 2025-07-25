import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app1/core/providers/app_model_provider.dart';

class ChangeStartDateButton extends StatelessWidget {
  const ChangeStartDateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => Provider.of<AppModel>(context, listen: false).pickDate(
        context,
        DateTime(2000),
        DateTime(2100),
        DateTime.now(),
      ),
      icon: Icon(Icons.date_range),
      label: Text(
        'Изменить дату призыва',
      ),
    );
  }
}
