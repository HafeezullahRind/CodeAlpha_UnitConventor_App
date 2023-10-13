import 'package:conventor_app/views/Area_Screen.dart';
import 'package:conventor_app/views/TempScreen.dart';
import 'package:conventor_app/views/lengthScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var devheight;
  var devwidth;
  @override
  Widget build(BuildContext context) {
    devheight = MediaQuery.of(context).size.height;
    devwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
          child: Text(
            'Conventor App',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Area',
              devwidth: devwidth,
              devheight: devheight,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AreaScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Length',
              devwidth: devwidth,
              devheight: devheight,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LengthScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: 'Temperature',
              devwidth: devwidth,
              devheight: devheight,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TemScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.devwidth,
    required this.devheight,
    required this.onTap,
    required this.text,
  });

  var devwidth;
  var devheight;
  String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        width: devwidth,
        height: devheight * 0.1,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
