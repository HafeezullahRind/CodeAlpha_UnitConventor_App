import 'package:flutter/material.dart';

import '../Widgets/CustomDropDown.dart';
import '../Widgets/TextFieldWidget.dart';
import '../utils/conversion_Methods.dart';

class TemScreen extends StatefulWidget {
  const TemScreen({super.key});

  @override
  State<TemScreen> createState() => _TemScreenState();
}

class _TemScreenState extends State<TemScreen> {
  List<String> items = [
    'Celsius',
    'Fahrenheit',
    'Kelvin',
  ];

  String? selectedItem = 'Celsius';
  String? selectedItem2 = 'Fahrenheit';
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
            'Temperature Conventor',
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
                CustomDropDown(
                    selectedItem: selectedItem,
                    items: items,
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
                  items: items,
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
                    final convertedResult = ConversionMethods.convertTemperature(
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
          ],
        ),
      ),
    );
  }
}
