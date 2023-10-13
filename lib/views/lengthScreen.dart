import 'package:flutter/material.dart';

import '../Widgets/CustomDropDown.dart';
import '../Widgets/TextFieldWidget.dart';
import '../utils/conversion_Methods.dart';

class LengthScreen extends StatefulWidget {
  const LengthScreen({super.key});

  @override
  State<LengthScreen> createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  List<String> lengthItems = [
    'Meter',
    'Kilometer',
    'Mile',
    'Yard',
    'Foot',
    'Inch',
  ];

  String? selectedItem = 'Meter';
  String? selectedItem2 = 'Kilometer';
  double inputValue = 0.0; // To store the user's input
  double result = 0.0; // To store the calculated result
  final TextEditingController _controller = TextEditingController();
  

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
            'Length Conventor',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
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
                CustomDropDown(
                    selectedItem: selectedItem,
                    items: lengthItems,
                    onChanged: updateSelectedItem1),
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
                CustomDropDown(
                  selectedItem: selectedItem2,
                  items: lengthItems,
                  onChanged: updateSelectedItem2,
                ),
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  onPressed: () {
                    final inputValue =
                        double.tryParse(_controller.text.toString()) ?? 0.0;
                    final convertedResult = ConversionMethods.convertLength(
                        inputValue, selectedItem!, selectedItem2!);

                    setState(() {
                      result = convertedResult;
                    });
                  },
                  child: const Text('Calculate')),
            ),
            const SizedBox(
              height: 40,
            ),
            result != 0.0
                ? Text('Result : ${'$result $selectedItem2'}',
                    style: const TextStyle(color: Colors.black, fontSize: 20))
                : const SizedBox(width: 0.0, height: 0.0)
          ])),
    );
  }
}
