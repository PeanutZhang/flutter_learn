


import 'dart:ui';
import 'package:flutter/material.dart';

class CommonUtils{

  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static getThemeData(Color color){
      return ThemeData(primarySwatch: color,platform: TargetPlatform.android);
  }

}