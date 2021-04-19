import 'package:devquizz/core/app_gradients.dart';
import 'package:devquizz/core/app_images.dart';
import 'package:flutter/material.dart';

class SplahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
