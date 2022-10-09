import 'package:flutter/material.dart';
import '/data/data.dart';
import '/extensions/extension.dart';

class AccountListRowWidget extends StatelessWidget {
  const AccountListRowWidget(this._accountData, {super.key});
  final AccountData _accountData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 226, 226, 226),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 80,
            child: _accountData.entityimageurl == null
                ? Image.asset('noimage'.png)
                : FadeInImage(
                    image: NetworkImage(_accountData.entityimageurl ?? ''),
                    placeholder: AssetImage('noimage'.png)),
          ),
          Expanded(
            child: Container(
              height: 80,
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _accountData.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        _accountData.address1Composite ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
