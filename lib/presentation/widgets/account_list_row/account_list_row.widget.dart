import 'package:flutter/material.dart';
import '/data/data.dart';
import '/extensions/extension.dart';

class AccountListRowWidget extends StatelessWidget {
  const AccountListRowWidget(this._accountData, this.isList, {super.key});
  final AccountData _accountData;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 226, 226, 226),
      child: isList
          ? Row(
              children: childsWidgets,
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: childsWidgets,
            ),
    );
  }

  List<Widget> get childsWidgets {
    return [
      SizedBox(
        width: 120,
        child: _accountData.entityimageurl == null
            ? Image.asset('noimage'.png)
            : FadeInImage(
                image: NetworkImage(_accountData.entityimageurl ?? ''),
                placeholder: AssetImage('noimage'.png)),
      ),
      !isList
          ? const SizedBox(
              height: 10,
            )
          : const SizedBox(),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      _accountData.name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.clip,
                      _accountData.address1Composite ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )
    ];
  }
}
