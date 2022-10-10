import 'package:flutter/material.dart';
import '/extensions/extension.dart';
import '/presentation/presentation.dart';

class NoWidgetMethod extends StatelessWidget {
  const NoWidgetMethod(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return NoDataWidget(
      image: Image.asset(
        'nodatafound'.png,
        height: 220,
      ),
      text: text,
      cross: Container(),
    );
  }
}
