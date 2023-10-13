import 'package:flutter/material.dart';

import '../Widgets/CustomDropDown.dart';
import '../Widgets/TextFieldWidget.dart';
import '../utils/conversion_Methods.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  List<String> items = [
    'Square kilometer',
    'Square meter',
    'Square mile',
    'Square yard',
    'Square foot',
    'Square Inch',
    'Hectare',
    'Acre'
  ];

  String? selectedItem;
  String? selectedItem2;
  double inputValue = 0.0;
  double result = 0.0;
  TextEditingController _controller = TextEditingController();

  

  void updateSelectedItem1(String? newItem) {
    setState(() {
      selectedItem = newItem;
    });
  }

  void updateSelectedItem2(String? newItem) {
    setState(() {
      selectedItem2 = newItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
          child: Text(
            'Area Converter',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('From',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    )),
                const SizedBox(
                  width: 4,
                ),
                CustomDropDown(selectedItem: selectedItem, items: items, onChanged: updateSelectedItem1, ),
                const Text(
                  'To',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                CustomDropDown(selectedItem: selectedItem2, items: items,onChanged: updateSelectedItem2),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFieldWidget(controller: _controller),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  final inputValue = double.tryParse(_controller.text) ?? 0.0;
                  final convertedResult =
                      ConversionMethods.convertArea(inputValue, selectedItem!, selectedItem2!);
                  setState(() {
                    result = convertedResult;
                  });

                  print("Selected Item 1: $selectedItem");
                  print("Selected Item 2: $selectedItem2");
                  print("Input Value: $inputValue");
                },
                child: const Text('Calculate'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            result != 0.0
                ? Text('Result : ${'$result $selectedItem2'}',
                    style: const TextStyle(color: Colors.black, fontSize: 20))
                : const SizedBox(width: 0.0, height: 0.0),
          ],
        ),
      ),
    );
  }
}
