import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    print("Input Text: ${_controller.text}");

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Enter your value'),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
    );
  }
}
