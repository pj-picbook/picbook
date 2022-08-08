import 'package:flutter/cupertino.dart';

// SignUpPageで使うCupertinoDatePickerの表示構成
Widget bottomPicker(Widget picker) {
  return Container(
    height: 216,
    padding: const EdgeInsets.only(top: 6.0),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}
