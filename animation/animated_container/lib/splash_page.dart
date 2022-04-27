import 'package:animated_container/circle_transition_clipper.dart';
import 'package:animated_container/dismissible_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  double backgroundImage = 1;
  double logoImage = 1;
  late ImageProvider logo;
  late ImageProvider background;

  late Animation<double> logoAnimationValue;
  late Animation<double> backgroundAnimationValue;

  late CurvedAnimation backgroundCurveAnimation;
  var logoScale = 1.0;
  var backgroundScale = 1.0;
  late AnimationController _logoAnimationController;
  late AnimationController _backgroundAnimationController;

  @override
  void initState() {
    super.initState();

    background = const AssetImage('assets/background.png');
    logo = const AssetImage('assets/logo.png');

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    logoAnimationValue =
        Tween(begin: 1.0, end: 0.8).animate(_logoAnimationController);

    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    backgroundCurveAnimation = CurvedAnimation(
      parent: _backgroundAnimationController,
      curve: Curves.easeInOut,
    );

    backgroundAnimationValue =
        Tween(begin: 1.0, end: 1.08).animate(backgroundCurveAnimation);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1500));
      loopBackground(context);
      loopLogo(context);

      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).push(_createRoute());
    });
  }

  void loopBackground(BuildContext context) {
    _backgroundAnimationController.forward().then((value) async {
      await Future.delayed(const Duration(milliseconds: 300));
      _backgroundAnimationController.reverse();
    });
  }

  void loopLogo(BuildContext context) {
    _logoAnimationController.forward().then(
      (value) async {
        await Future.delayed(const Duration(milliseconds: 300));
        _logoAnimationController.reverse();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _backgroundAnimationController,
            builder: (context, child) {
              return Transform.scale(
                alignment: Alignment.bottomCenter,
                scale: backgroundAnimationValue.value,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: background,
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: SizedBox(
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedBuilder(
                    animation: _logoAnimationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: logoAnimationValue.value,
                        child: Container(
                          height: 60,
                          width: 154,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: logo),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DismissibleAnimation(),
      transitionDuration: const Duration(milliseconds: 2000),
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

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }
}
