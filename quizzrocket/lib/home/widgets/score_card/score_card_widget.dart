import 'package:devquizz/core/app_colors.dart';
import 'package:devquizz/core/app_text_styles.dart';
import 'package:devquizz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: constraints.maxHeight * 0.52,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vamos começar",
                        style: AppTextStyles.heading,
                      ),
                      Text("Complete os desafios e avance em conhecimeto")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
