import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final Widget? cross;
  final String text;
  final Widget? image;
  const NoDataWidget(
      {Key? key, required this.text, required this.cross, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(alignment: Alignment.topRight, child: cross),
          Expanded(
            child: Container(),
          ),
          Container(child: image),
          const SizedBox(
            height: 30,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
