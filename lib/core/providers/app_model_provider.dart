import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider_app1/core/repositories/abstr/sh_prefs_repository.dart';

class AppModel extends ChangeNotifier {
  AppModel(this.shPrefRepository);
  //дата начала
  DateTime _startDate = DateTime.now();
  DateTime get startDate => _startDate;
  String get startDay => _startDate.day.toString().padLeft(2, '0');
  String get startMonth => _startDate.month.toString().padLeft(2, '0');
  String get startYear => _startDate.year.toString();
  //текущая дата
  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  // Дата возвращения
  DateTime get finalDate => _startDate.add(Duration(days: 365));
  String get finalDay =>
      _startDate.add(Duration(days: 365)).day.toString().padLeft(2, '0');
  String get finalMonth =>
      _startDate.add(Duration(days: 365)).month.toString().padLeft(2, '0');
  String get finalYear => _startDate.add(Duration(days: 365)).year.toString();
  // Таймеры
  Timer? _dateCheckTimer;

  int get daysToFinal => finalDate.difference(currentDate).inDays + 1;
  double get leftGradientValue =>
      1 - (finalDate.difference(currentDate).inDays + 1) / 365;

  final ShPrefRepository shPrefRepository;

  void initModel() async {
    _initData();
    _startMidnightTimer();
  }

  void _initData() async {
    _startDate =
        DateTime.tryParse(await shPrefRepository.getString('start_date')) ??
            DateTime.now();
    notifyListeners();
  }

  void _startMidnightTimer() {
    _dateCheckTimer?.cancel();
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final timerDuration = midnight.difference(now).inSeconds;
    _dateCheckTimer = Timer(Duration(seconds: timerDuration + 1), () {
      _currentDate = DateTime.now();
      notifyListeners();
    });
  }

  void pickDate(BuildContext context, DateTime firstDate, DateTime lastDate,
      [initialDate]) async {
    final newStartDate = await showDatePicker(
          context: context,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate: initialDate,
        ) ??
        _startDate;
    _startDate = newStartDate;
    shPrefRepository.setString('start_date', _startDate.toString());
    print(_startDate.toString());
    notifyListeners();
  }
}
