
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.selectedItem,
    required this.items, required this.onChanged,
  });

  String? selectedItem;
  final List<String> items;
  final void Function(String?) onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField(
        value: widget.selectedItem,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.black),
                  ),
                ))
            .toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
