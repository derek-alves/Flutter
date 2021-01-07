import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AdaptativeTextField extends StatelessWidget {
  final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  final String label;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    this.controller,
    this.keyBoardType,
    this.onSubmitted,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyBoardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            keyboardType: keyBoardType,
            onSubmitted: onSubmitted,
            controller: controller,
            decoration: InputDecoration(labelText: label),
          );
  }
}
