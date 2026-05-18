import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isWindows
        ? const HomeDesktopPage()
        : const HomeMobilePage();
  }
}