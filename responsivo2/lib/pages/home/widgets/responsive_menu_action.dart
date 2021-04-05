import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveMenuAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: [Condition.smallerThan(name: TABLET)],
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        const SizedBox(width: 4),
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/59737946?s=400&u=3be486fd32e1d1a1a9dae23a33d9a3c17b06b230&v=4"),
        )
      ],
    );
  }
}
