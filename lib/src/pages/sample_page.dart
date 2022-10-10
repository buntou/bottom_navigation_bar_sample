import 'package:flutter/material.dart';
import '../utils/debug_logger.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({
    required this.label,
    this.pageColor,
    Key? key,
  }) : super(key: key);
  final String label;
  final Color? pageColor;

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Colors.black;
    if (pageColor != null) {
      defaultColor = pageColor!;
    }

    logger.i("build sample page");

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Container(
        color: defaultColor,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
