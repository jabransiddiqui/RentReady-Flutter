import 'package:flutter/material.dart';
import 'package:async/async.dart';

class SearchFieldWidget extends StatefulWidget {
  final void Function(String value) onChanged;
  final int delyTimeInMilliSecond;
  final String title;
  const SearchFieldWidget(
      {Key? key,
      required this.onChanged,
      required this.title,
      this.delyTimeInMilliSecond = 300})
      : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late CancelableOperation<void> cancellableOperation;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(Duration(milliseconds: widget.delyTimeInMilliSecond)),
      onCancel: () {
        // print('Canceled');
      },
    );
  }

  void _onItemChanged(String? value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      widget.onChanged(value ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search',
      ),
      onChanged: _onItemChanged,
    );
  }
}
