import 'package:devquizz/core/app_colors.dart';
import 'package:devquizz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 80,
        width: 80,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: constraints.maxHeight * 0.48,
                width: constraints.maxWidth * 0.9,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: .75,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text("75%", style: AppTextStyles.heading),
            )
          ],
        ),
      );
    });
  }
}
