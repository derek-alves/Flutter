import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool stateOfButton = false;
  bool stateOfText = false;
  double opacity = 0.0;
  double buttonWidth = 60;

  Future<void> changeButton() async {
    setState(() {
      stateOfButton = !stateOfButton;
    });
    if (stateOfButton) {
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {
        opacity = 0.3;
        buttonWidth = 140;
      });
      await Future.delayed(const Duration(milliseconds: 400));
      setState(() {
        stateOfText = true;
      });
    }
  }

  Future<void> onEndAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      stateOfText = false;
      opacity = 0;
      buttonWidth = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              onEnd: onEndAnimation,
              constraints: const BoxConstraints(maxWidth: 140, minWidth: 70),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: buttonWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white.withOpacity(opacity),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: stateOfText, child: const Text("desejo salvo!")),
                  GestureDetector(
                    onTap: changeButton,
                    child: Text(
                      "<3",
                      style: TextStyle(
                        color:
                            stateOfButton == false ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
