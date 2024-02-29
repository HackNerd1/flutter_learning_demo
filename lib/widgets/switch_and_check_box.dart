import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  const SwitchAndCheckBox({super.key});

  @override
  State<SwitchAndCheckBox> createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: _switchSelected,
            onChanged: (value) => {
                  setState(() {
                    _switchSelected = value;
                  })
                }),
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) => {
                  setState(() {
                    _checkboxSelected = value!;
                  })
                })
      ],
    );
  }
}
