import 'package:animated_container/circle_transition_clipper.dart';
import 'package:animated_container/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double backgroundImage = 1;
  double logoImage = 1;
  late final Image image;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).push(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/backred.png",
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/logo.png",
            scale: logoImage,
          )
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MyHomePage(title: "Home"),
      transitionDuration: const Duration(milliseconds: 3000),
      reverseTransitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var screenSize = MediaQuery.of(context).size;
        var centerCircleClipper =
            Offset(screenSize.width / 2, screenSize.height / 2);

        double begingRadius = 0.0;
        double endRadius = screenSize.height * 1.2;

        var radiusTween = Tween(begin: begingRadius, end: endRadius);
        var radiusTweenAnimation = animation.drive(radiusTween);

        return ClipPath(
          child: child,
          clipper: CircleTransitionClipper(
            center: centerCircleClipper,
            radius: radiusTweenAnimation.value,
          ),
        );
      },
    );
  }
}
