import 'package:flutter/material.dart' show runApp;
import 'package:takyeebbak/core/error/screen_error.dart';
import 'package:takyeebbak/core/routing/app_router.dart';
import 'package:takyeebbak/takyeebbak.dart';

void main() {
  errorScreen();
  runApp(TakyeebBak(AppRouter()));
}
