import 'package:flutter/material.dart';
import 'package:taskapp/utils/utils.dart';

class DropdownWidget extends StatefulWidget {
  final List<String> itemList;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final ValueChanged<int> onChange;

  const DropdownWidget(
      {Key? key,
      required this.itemList,
      this.borderRadius,
      required this.onChange,
      this.backgroundColor = Colors.white,
      this.iconColor = Colors.black})
      : super(key: key);
  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;

  @override
  void initState() {
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject()! as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: TextButton(
        child: Row(children: const [
          Icon(Icons.filter_alt),
          Text("Filter"),
        ]),
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width + 45,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArrowClipperWidget(),
                    child: Container(
                      width: 17,
                      height: 17,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: widget.itemList.length * 30,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 241, 241),
                      borderRadius: _borderRadius,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(widget.itemList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            widget.onChange(index);
                            closeMenu();
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Text(widget.itemList[index])),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
