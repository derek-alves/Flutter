import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(label),
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
