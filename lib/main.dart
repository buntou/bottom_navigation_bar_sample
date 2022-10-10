import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_01/src/pages/cupertino_scaffold_navigation_bar.dart';
import 'package:flutter_sample_01/src/pages/material_scaffold_navigation_bar.dart';

void main() {
  runApp(
    ProviderScope(
      // child: AppWithMaterialScaffoldNavigationBar(),
      child: AppWithCupertinoScaffoldNavigationBar(),
    ),
  );
}
