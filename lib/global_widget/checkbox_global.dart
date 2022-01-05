import 'package:flutter/material.dart';

class GlobalCheckBox extends StatelessWidget {
  const GlobalCheckBox({Key? key, required this.value, required this.onChange})
      : super(key: key);

  final bool value;
  final void Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        width: 30,
        child: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.all(Colors.black),
          value: value,
          onChanged: onChange,
        ));
  }
}
