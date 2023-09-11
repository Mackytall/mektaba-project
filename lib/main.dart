import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/pages/mektaba/mektaba_main_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: MektabaMainScreen(),
  ));
}
