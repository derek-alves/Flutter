import 'package:flutter/material.dart';
import 'package:resposivo1/utils/breakPoints.dart';

class AdvantagesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildHorizontalAdvantage(String title, String subtitle) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.white, size: 50),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      );
    }

    Widget buildVerticalAdvantage(String title, String subtitle) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.white, size: 50),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      );
    }

    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth >= mobileBreakPoints) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 16,
            spacing: 8,
            children: [
              buildHorizontalAdvantage(
                  "Estudo garantido", "Responsividade na pratica"),
              buildHorizontalAdvantage(
                  "Estudo garantido", "Responsividade na pratica"),
              buildHorizontalAdvantage(
                  "Estudo garantido", "Responsividade na pratica"),
            ],
          ),
        );
      }

      return Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: buildVerticalAdvantage(
                  "Estudo garantido", "Responsividade na pratica"),
            ),
            SizedBox(width: 6),
            Expanded(
              child: buildVerticalAdvantage(
                  "Estudo Verdadeiro", "Responsividade na pratica"),
            ),
            SizedBox(width: 6),
            Expanded(
              child: buildVerticalAdvantage(
                  "Estudo garantido", "Responsividade na pratica"),
            ),
          ],
        ),
      );
    });
  }
}
