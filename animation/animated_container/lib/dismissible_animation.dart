import 'package:flutter/material.dart';

class DismissibleAnimation extends StatefulWidget {
  const DismissibleAnimation({Key? key}) : super(key: key);

  @override
  _DismissibleAnimationState createState() => _DismissibleAnimationState();
}

class _DismissibleAnimationState extends State<DismissibleAnimation> {
  bool startedAnimation = false;
  double widthContaier = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      startAnimation();
    });
  }

  void startAnimation() async {
    setState(() {
      widthContaier = MediaQuery.of(context).size.width / 2;
      startedAnimation = true;
    });
  }

  void endAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      widthContaier = 0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    startedAnimation = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dissmissible'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          AnimatedContainer(
            onEnd: endAnimation,
            width: widthContaier,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            color: Colors.green,
            child: Center(
              child: Visibility(
                visible: startedAnimation,
                child: const Icon(Icons.tram_sharp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
