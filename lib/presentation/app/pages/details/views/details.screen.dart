import 'package:flutter/material.dart';
import '/data/data.dart';
import '/extensions/extension.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(this._accountData, {super.key});
  final AccountData _accountData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Detail'),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: widget._accountData.entityimageurl == null
                      ? Image.asset('noimage'.png)
                      : FadeInImage(
                          image: NetworkImage(
                              widget._accountData.entityimageurl ?? ''),
                          placeholder: AssetImage('noimage'.png)),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    "Name:",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    widget._accountData.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    "Account No.:",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    widget._accountData.accountnumber ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    "State Code:",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "${widget._accountData.statecode ?? ''}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    "State Province:",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    widget._accountData.address1Stateorprovince ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 70,
                  child: Text(
                    "Address:",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    widget._accountData.address1Composite ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
