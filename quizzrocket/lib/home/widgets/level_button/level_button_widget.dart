import 'package:devquizz/core/app_colors.dart';
import 'package:devquizz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  const LevelButtonWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.levelButtonBorderFacil,
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.levelButtonBorderFacil),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              color: AppColors.levelButtonTextFacil, fontSize: 13),
        ),
      ),
    );
  }
}
