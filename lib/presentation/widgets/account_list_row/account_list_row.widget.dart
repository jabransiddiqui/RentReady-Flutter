import 'package:flutter/material.dart';

class AccountListRowWidget extends StatelessWidget {
  const AccountListRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      color: Colors.grey,
      child: Row(
        children: [
          Container(
            color: Colors.red,
            width: 120,
            height: 80,
            child: const Center(child: Text("Image")),
          ),
          Container(
            height: 80,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: const [Text("data")],
                ),
                Row(
                  children: const [Text("data")],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
